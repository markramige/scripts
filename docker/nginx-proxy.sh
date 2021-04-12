#!/bin/sh

docker run -d \
              -p 80:80 \
              -p 443:443 \
              -v /etc/nginx-proxy/certs:/etc/nginx/certs \
              -v /etc/nginx-proxy/vhost.d:/etc/nginx/vhost.d \
              -v /etc/nginx-proxy/html:/usr/share/nginx/html \
              -v /var/run/docker.sock:/tmp/docker.sock:ro \
              --name nginx-proxy \
              jwilder/nginx-proxy # no recent tag, check latest for any issues before running

docker run -d \
              -e "DEFAULT_EMAIL=" \
              --volumes-from nginx-proxy \
              -v /var/run/docker.sock:/var/run/docker.sock:ro \
              --name nginx-proxy-letsencrypt \
              jrcs/letsencrypt-nginx-proxy-companion:2.1
