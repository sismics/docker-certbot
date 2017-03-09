FROM ubuntu:16.10
MAINTAINER Jean-Marc Tremeaux <jm.tremeaux@sismics.com>

# Install Certbot
RUN apt-get update && apt-get install -y bsdmainutils certbot cron --no-install-recommends

COPY etc /etc
COPY usr /usr
COPY root /root

# Give execution rights to scripts
RUN chmod 0744 /etc/cron.d/certbot /usr/local/bin/*

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
CMD ["help"]
