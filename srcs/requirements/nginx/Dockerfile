FROM	debian:bullseye

RUN		apt-get update
RUN		apt-get install -y nginx
RUN		mkdir -p /etc/nginx/ssl
RUN		apt-get install -y openssl

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt \
    -keyout /etc/nginx/ssl/inception.key \
    -subj "/C=FR/ST=CM/L=Angouleme/O=42/OU=42/CN=lauger.42.fr/UID=lauger"

COPY ./conf/nginx.conf /etc/nginx/conf.d
# COPY ./conf/index.html /var/www/html/index.html

RUN chmod -R 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]
