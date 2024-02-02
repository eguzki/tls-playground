SHELL = /usr/bin/env bash -o pipefail
.SHELLFLAGS = -ec
.DEFAULT_GOAL := server
MKFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
WORKDIR := $(patsubst %/,%,$(dir $(MKFILE_PATH)))
DOCKER ?= $(shell which docker 2> /dev/null || echo "docker")

server:
	@if [ ! -d "$(WORKDIR)/cert" ]; then \
       echo "$(WORKDIR)/cert does not exist! run make certs!"; \
       exit 1; \
  fi
	$(DOCKER) compose -f docker-compose.yaml up --attach tls.example.com

clientcerts:
	openssl req -newkey rsa:4096 -sha256 -nodes \
		-subj "/CN=$(DOMAIN)" \
		-addext 'subjectAltName = DNS:$(DOMAIN)' \
		-keyout $(DOMAIN).key \
		-out $(DOMAIN).csr
	chmod +r $(DOMAIN).key
	openssl x509 -req \
		-in $(DOMAIN).csr \
		-CA $(WORKDIR)/cert/rootCA.pem \
		-CAkey $(WORKDIR)/cert/rootCA.key \
		-CAcreateserial \
		-out $(DOMAIN).crt \
		-days 365 \
		-sha256
	openssl x509 -noout -text -in $(DOMAIN).crt

$(WORKDIR)/cert:
	mkdir -p cert

$(WORKDIR)/cert/rootCA.pem $(WORKDIR)/cert/rootCA.key:
	$(MAKE) -f $(WORKDIR)/Makefile $(WORKDIR)/cert
	openssl genrsa -out $(WORKDIR)/cert/rootCA.key 2048
	openssl req -batch -new -x509 -nodes -sha256 \
		-key $(WORKDIR)/cert/rootCA.key \
		-days 365 \
		-subj '/CN=caeguzki' \
		-addext "subjectAltName = DNS:caeguzki" \
		-out $(WORKDIR)/cert/rootCA.pem
	openssl x509 -noout -text -in $(WORKDIR)/cert/rootCA.pem

$(WORKDIR)/cert/tls.example.com.key $(WORKDIR)/cert/tls.example.com.crt:
	$(MAKE) -f $(WORKDIR)/Makefile $(WORKDIR)/cert/rootCA.pem $(WORKDIR)/cert/rootCA.key
	$(MAKE) clientcerts -C $(WORKDIR)/cert -f $(WORKDIR)/Makefile DOMAIN=tls.example.com

$(WORKDIR)/cert/tls.example.com.pem:
	$(MAKE) -f $(WORKDIR)/Makefile $(WORKDIR)/cert/tls.example.com.key $(WORKDIR)/cert/tls.example.com.crt
	cat $(WORKDIR)/cert/tls.example.com.key $(WORKDIR)/cert/tls.example.com.crt $(WORKDIR)/cert/rootCA.pem >$@

.PHONY: certs
certs: clean $(WORKDIR)/cert/tls.example.com.pem

.PHONY: clean
clean:
	$(DOCKER) compose down --volumes --remove-orphans
	$(DOCKER) compose -f docker-compose.yaml down --volumes --remove-orphans
	- rm -rf $(WORKDIR)/cert
