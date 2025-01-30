FROM debian:bullseye

RUN apt-get update
RUN apt-get install -y nginx
RUN apt-get install -y openssl

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt \
    -keyout /etc/nginx/ssl/inception.key \
    -subj "/C=FR/ST=CM/L=Angouleme/O=42/OU=42/CN=lauger.42.fr/UID=lauger"

RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/conf.d

COPY index.html /usr/share/nginx/html/index.html

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]
