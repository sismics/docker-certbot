#!/bin/sh
docker rm -f certbot
docker run -ti -h letsencrypt-manager --name certbot \
    -e LE_RSA_KEY_SIZE=4096 \
    -v letsencrypt_etc:/etc/letsencrypt \
    -v acme_webroot:/var/acme-webroot \
    sismics/certbot:0.8.1 "$@"

