## Create self signed certificate

```
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout haproxy.key -out haproxy.crt -nodes -subj "/CN=localhost"
```

```
sudo docker run -d -p 80:80 -p 443:443 -v /etc/haproxy/haproxy.key:/etc/haproxy -v /etc/haproxy:/etc/haproxy/certs -v data2:/var/jenkins_home haproxy:latest
```
