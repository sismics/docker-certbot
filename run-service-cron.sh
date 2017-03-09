#!/bin/sh
docker rm -f certbot_auto_renewal
docker run -d -h certbot-auto-renewal --name certbot_auto_renewal --restart=always \
    -e LE_RSA_KEY_SIZE=4096 \
    -v letsencrypt_etc:/etc/letsencrypt \
    -v acme_webroot:/var/acme-webroot \
    sismics/certbot:0.8.1 cron-auto-renewal
