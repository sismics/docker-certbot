# docker-certbot
Dockerfile for Certbot.

This image can be used with [Haproxygen](https://github.com/sismics/docker-haproxygen) to add Let's Encrypt certificates to your reverse proxy and renew them automatically. 

## Usage
Run the command **run-certbot.sh** to see a list of commands.

Certificates are generated in the **letsencrypt_etc** volume under **/etc/letsencrypt**.

Challenges are generated in the **acme_webroot** volume under **/var/acme_webroot**.

- Listing all domains :

```
./run-certbot.sh list
```

- Adding a domain :

```
./run-certbot.sh add my.domain.com
```

- Adding a domain and aliases (Subject Alternative Names) :

```
./run-certbot.sh add domain.com another.domain.com
```

- Removing a domain :

```
./run-certbot.sh remove domain.com
```

### Auto-renewal

Run the auto-renewal container with the following command :
 
```
./run-service-cron.sh
```

Certificates are issued for **90** days, and renewed automatically **28** days before expiration.
 