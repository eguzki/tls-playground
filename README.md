# tls-playground

## Create the SSL Certificates

```sh
make certs
```

## Run the HTTP server

```sh
make server
```

## Testing curl

```sh
curl --resolve tls.example.com:443:127.0.0.1 -v --cacert cert/rootCA.pem "https://tls.example.com:443"
```

## Testing openssl

```sh
openssl s_client -showcerts -servername tls.example.com -connect 127.0.0.1:443 -CAfile cert/rootCA.pem
```
