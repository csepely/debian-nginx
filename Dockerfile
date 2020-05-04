FROM debian-base
RUN apt-get -y install nginx certbot python-certbot-nginx
RUN mkdir -p /var/lib/letsencrypt/.well-known/acme-challenge/ && \
    chgrp www-data /var/lib/letsencrypt && \
    chmod g+s /var/lib/letsencrypt && \
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log
VOLUME ["/etc/nginx/", "/etc/certbot", "/etc/letsencrypt/", "/var/www/html/", "/var/lib/letsencrypt/", "/var/log/letsencrypt/"]
EXPOSE 80
EXPOSE 443
STOPSIGNAL SIGTERM
CMD ["nginx", "-g", "daemon off;"]
