FROM haproxy
MAINTAINER <email>

RUN opkg-install haproxy ca-certificates && mkdir -p /etc/haproxy/certs

VOLUME ["/etc/haproxy/certs"]

ADD haproxy.cfg /etc/haproxy/haproxy.cfg

EXPOSE 80 443

CMD ["/usr/sbin/haproxy", "-db", "-f", "/etc/haproxy/haproxy.cfg"]
