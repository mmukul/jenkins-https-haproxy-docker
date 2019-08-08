## Create self signed certificate

```
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout haproxy.key -out haproxy.crt
```

Then, combine the two together in a PEM file:

```
$ cat haproxy.crt haproxy.key > haproxy.pem
```

```
$ sudo docker run -d --name haproxy -v /path/to/etc/haproxy:/usr/local/etc/haproxy:ro haproxy:latest
