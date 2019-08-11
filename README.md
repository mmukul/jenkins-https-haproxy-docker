## Create self signed certificate for Jenkins with haproxy


```
$ sudo mkdir /var/jenkins_home

$ sudo openssl genrsa -out /var/jenkins_home/ssl.key 1024

$ sudo openssl req -new -key /var/jenkins_home/ssl.key \
       -out /var/jenkins_home/ssl.csr -nodes -subj "/CN=localhost"

$ sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -in /var/jenkins_home/ssl.key \
       -out /var/jenkins_home/ssl.crt -nodes -subj "/CN=localhost"

$ sudo cat /var/jenkins_home/ssl.crt /var/jenkins_home/ssl.key \
           | sudo tee /var/jenkins_home/ssl.pem
```

```
$ sudo docker run --rm -p 443:8443 -v /var/jenkins_home/ssl.key:/var/jenkins_home -v /etc/haproxy:/etc/haproxy/certs -v data2:/var/jenkins_home haproxy:latest
```
