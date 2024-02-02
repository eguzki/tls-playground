# tls-playground

Two level depth (0, 1) certificate chain

```sh
> openssl verify -show_chain -CAfile cert/rootCA.pem cert/tls.example.com.crt
cert/tls.example.com.crt: OK
Chain:
depth=0: CN = tls.example.com (untrusted)
depth=1: CN = caeguzki
```

### Self-signed root certificate (CN = caeguzki)

```sh
openssl x509 -in cert/rootCA.pem -text -noout
```

<details>

```
Certificate:
    Data:
        Version: 3 (0x2)
        Serial Number:
            36:b8:3e:74:f0:8d:cc:46:33:d2:55:f9:eb:c0:a3:10:ad:9c:ca:57
        Signature Algorithm: sha256WithRSAEncryption
        Issuer: CN = caeguzki
        Validity
            Not Before: Feb  2 08:26:33 2024 GMT
            Not After : Nov 22 08:26:33 2026 GMT
        Subject: CN = caeguzki
        Subject Public Key Info:
            Public Key Algorithm: rsaEncryption
                Public-Key: (2048 bit)
                Modulus:
                    00:97:68:0c:e7:b8:b7:af:fa:bb:b8:d8:2e:d2:c5:
                    c8:b2:7a:99:f9:67:60:bb:7e:09:ff:61:6b:cd:19:
                    54:19:2a:2b:9e:df:48:ae:63:3a:46:17:38:c2:0e:
                    f1:6a:a8:d2:f8:4d:65:af:fe:08:b2:6f:d2:3e:30:
                    ec:0d:ed:20:17:53:ed:56:38:06:2a:65:82:2f:76:
                    fd:b7:39:f4:09:1a:41:b8:ce:2c:fe:53:45:88:52:
                    2c:4d:25:0c:43:ed:28:8b:ef:79:de:4e:2b:f4:96:
                    2b:2e:78:bd:b4:b9:95:8b:51:af:18:33:5e:32:d3:
                    e0:09:95:0f:28:3c:78:95:f3:56:99:15:de:53:9f:
                    a7:70:f0:ec:b1:0a:86:3b:6b:6e:df:c4:af:db:5b:
                    6c:fb:1a:02:c7:95:42:2c:e2:c0:1d:cf:80:27:00:
                    48:75:8d:92:60:0e:1e:1a:a3:17:8c:41:d4:f2:46:
                    fd:89:97:53:b7:34:86:8a:7b:fd:3b:93:36:01:c0:
                    8e:eb:4a:04:78:70:75:1d:ed:9a:07:69:6d:64:45:
                    ef:e9:b8:b2:71:89:0e:03:82:d9:88:fe:67:ed:87:
                    6c:14:d2:ee:41:d9:7e:91:8b:2d:dc:d9:5b:40:5c:
                    6a:ef:e6:99:5e:71:cb:43:f8:f5:7a:b5:26:7f:4c:
                    7b:89
                Exponent: 65537 (0x10001)
        X509v3 extensions:
            X509v3 Subject Key Identifier:
                9B:FB:CB:46:2F:54:82:A5:3B:CB:4B:81:C6:50:8B:BC:8C:42:7D:AF
            X509v3 Authority Key Identifier:
                9B:FB:CB:46:2F:54:82:A5:3B:CB:4B:81:C6:50:8B:BC:8C:42:7D:AF
            X509v3 Basic Constraints: critical
                CA:TRUE
    Signature Algorithm: sha256WithRSAEncryption
    Signature Value:
        2d:a4:15:01:8c:e8:92:41:13:10:d6:35:55:5e:33:7b:bd:19:
        48:3c:8b:25:dc:0c:87:8a:3e:74:f2:90:e5:61:1d:a5:7d:d7:
        a5:8e:9b:e3:62:32:55:e0:ce:31:e3:5e:62:75:3c:46:56:fd:
        9f:6a:49:f5:b6:55:67:e6:76:d0:ea:a4:9f:5e:fc:4f:bf:7b:
        d0:dc:7f:13:b0:cb:fd:c7:88:44:f8:ec:d9:c3:0a:8f:dd:d1:
        7f:d5:2a:64:9e:0d:54:b2:56:16:82:23:3e:de:4f:f1:ec:34:
        70:2f:2f:f6:ac:31:f2:34:05:b8:79:77:3b:4f:a6:f5:48:da:
        89:91:d0:28:e3:2b:99:d9:91:f5:f5:1c:b0:21:0e:92:a6:83:
        aa:3e:e0:ea:82:16:9e:8b:a9:4a:da:df:83:58:53:a3:67:3a:
        90:ee:af:46:f5:ce:85:60:82:11:d9:07:47:fa:f9:64:8c:ad:
        7c:4e:7d:c8:33:0b:61:35:83:cc:a9:4f:82:68:8d:8d:09:14:
        a9:79:f8:9a:9a:dd:9b:8d:b3:6b:83:b9:e4:4c:c8:cb:7a:3f:
        41:1d:2f:94:ff:e4:a3:38:03:37:c2:71:b4:a9:f8:e6:b0:dd:
        db:32:51:8f:90:72:9c:76:b8:4a:e9:2f:b6:72:10:d6:6e:02:
        db:13:65:b9
```

</details>

### tls.example.com certificate

```sh
openssl x509 -in cert/tls.example.com.crt -text -noout
```

<details>

```
Certificate:
    Data:
        Version: 1 (0x0)
        Serial Number:
            39:3a:53:b8:96:e7:a7:d1:92:c6:a8:06:d7:48:83:2c:b8:96:08:de
        Signature Algorithm: sha256WithRSAEncryption
        Issuer: CN = caeguzki
        Validity
            Not Before: Feb  2 08:26:35 2024 GMT
            Not After : Jun 16 08:26:35 2025 GMT
        Subject: CN = tls.example.com
        Subject Public Key Info:
            Public Key Algorithm: rsaEncryption
                Public-Key: (4096 bit)
                Modulus:
                    00:ba:92:c3:79:66:8f:ba:78:1f:dd:91:6f:bf:16:
                    54:68:4d:c0:92:75:15:81:86:ab:a9:c4:6c:b2:0c:
                    13:82:21:7b:d9:87:19:c6:62:40:17:0c:a0:77:60:
                    1b:1f:64:71:24:16:50:57:5c:a7:ce:36:b0:31:ea:
                    a2:83:97:ff:32:7c:b5:43:85:2d:92:6e:b1:a3:c1:
                    54:30:47:1e:fa:c8:d1:fc:4b:dd:55:93:26:76:1e:
                    23:62:33:84:7f:f4:cb:f3:7f:c3:04:68:c3:78:3f:
                    ae:cd:3e:b5:6b:5e:ee:4a:c8:49:0a:87:10:32:73:
                    87:31:8a:21:3b:9e:88:9b:6e:64:83:1d:5e:6f:f9:
                    71:f1:21:18:f9:be:6f:80:ef:be:9e:09:fd:93:86:
                    c7:85:08:43:64:ae:2b:e4:c7:b8:af:d3:5c:10:5e:
                    41:84:ad:9b:a1:27:a0:66:75:cd:10:d4:f9:a2:80:
                    57:5c:48:2f:50:16:b6:d5:20:53:ee:04:9b:4a:06:
                    db:cb:91:3d:a9:78:d5:aa:04:21:6c:7e:82:1b:2a:
                    6f:8f:23:46:fb:5a:1c:65:28:93:d5:f0:60:b5:9c:
                    ea:f2:61:23:b2:1d:01:03:b4:ed:6a:17:a1:f0:02:
                    2c:fb:d8:27:fa:51:2f:85:4f:02:29:1a:ae:2a:3b:
                    3a:46:61:a0:63:59:32:a8:17:37:62:06:76:eb:8e:
                    ee:58:96:51:bb:c6:a6:bf:99:3a:3a:8b:a9:bc:e3:
                    e1:7b:ef:be:fa:8b:8b:da:f7:67:22:3e:ed:36:f6:
                    a1:0b:2d:fd:93:3a:ee:12:99:c8:68:e2:c7:f7:39:
                    6d:95:44:28:d3:19:ff:d3:27:84:fa:81:04:60:f8:
                    61:e6:98:24:23:fe:65:0c:25:95:a3:e3:9a:9c:d9:
                    30:b6:6c:3e:95:73:49:6f:ab:a4:c5:cb:9d:df:cd:
                    b7:4e:7a:4e:11:2f:5c:c3:9b:73:66:c8:dd:2a:55:
                    d7:8f:bb:fe:be:bf:af:2a:3e:c2:13:e4:9b:0d:1c:
                    2b:e7:8d:83:f9:47:04:60:60:41:e1:fe:ea:99:ce:
                    4b:be:29:75:ae:06:7c:b2:ae:91:bb:75:53:fe:e2:
                    58:7d:e7:33:09:11:00:9a:84:a9:5f:7e:94:e6:72:
                    71:2f:0d:c4:95:32:63:1e:2d:3d:1f:e1:c8:ed:29:
                    73:4c:98:d9:50:53:ad:51:da:64:a8:7a:02:45:15:
                    56:f9:2a:ba:f2:2a:77:b9:84:24:69:9f:e3:de:67:
                    32:05:9b:74:5d:06:5e:25:56:de:ee:6b:6c:cb:6d:
                    52:6e:d2:b8:e8:22:e5:67:60:6f:da:47:24:1f:d4:
                    71:d3:17
                Exponent: 65537 (0x10001)
    Signature Algorithm: sha256WithRSAEncryption
    Signature Value:
        04:98:ee:3c:f8:a7:d5:45:1d:a0:b8:5f:d2:86:49:05:4a:68:
        94:8b:73:a8:ea:92:a5:84:24:2d:aa:90:bb:e4:07:1e:b4:e6:
        03:b4:a6:6e:30:59:1e:50:aa:40:36:28:69:be:30:4d:3b:48:
        7f:01:8a:a2:4e:14:d7:2b:f4:16:9c:3c:96:ba:5e:b6:bf:a1:
        50:0d:2f:52:07:96:a2:04:22:40:4d:40:b2:82:2e:f6:f8:61:
        55:3c:e6:94:1b:04:b2:3b:43:a5:8c:66:92:e0:34:48:51:1c:
        bd:b4:f5:27:02:86:c8:a5:1f:24:bb:be:80:81:e5:2a:c8:ff:
        8c:b6:3d:0c:2d:43:ad:8f:60:62:55:33:08:28:03:99:c3:34:
        84:2e:76:81:24:cc:bd:30:50:1e:be:da:0d:7d:ed:8f:1e:04:
        7a:54:e9:8d:ce:72:79:9c:a6:08:f6:8d:9a:16:0d:5f:ea:fd:
        59:f9:d7:69:c9:6d:46:be:03:83:6b:77:d7:f7:56:e5:8b:1c:
        20:17:ef:a6:ba:10:d3:e1:2d:19:89:9c:9c:c1:73:7a:67:ee:
        d0:2d:d5:12:f2:c2:5b:a8:6e:9d:b6:c2:d6:2b:02:ac:a4:7f:
        6a:1c:02:2c:af:d0:38:49:b2:82:69:19:22:a4:0a:06:36:ef:
        bf:d6:52:d8
```

</details>

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
curl --resolve tls.example.com:443:127.0.0.1 -v --cacert cert/rootCA.pem "https://tls.example.com:443/get"
```

## Testing openssl

```sh
openssl s_client -showcerts -servername tls.example.com -connect 127.0.0.1:443 -CAfile cert/rootCA.pem
```

## Clean env

```sh
make clean
```
