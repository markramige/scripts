#!/bin/sh

docker run --cap-add=NET_ADMIN --device=/dev/net/tun -d \
	      --dns=1.1.1.1 \
              -v /mnt/media:/data \
              -v /etc/localtime:/etc/localtime:ro \
              --env-file transmission-openvpn.env \
              -p 127.0.0.1:9091:9091 \
              --name=transmission-openvpn \
              haugene/transmission-openvpn:3.6
