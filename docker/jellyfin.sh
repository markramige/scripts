#!/bin/sh
docker run -d \
              -e VIRTUAL_HOST= \
              -e LETSENCRYPT_HOST= \
              -v /mnt/media/jellyfin/config:/config \
              -v /mnt/media/jellyfin/cache:/cache \
              -v /mnt/media/jellyfin/media:/media \
              --user 9999:9999 \
              -p 127.0.0.1:8096:8096 \
              --restart=unless-stopped \
              --name=jellyfin \
              jellyfin/jellyfin:10.7.2
