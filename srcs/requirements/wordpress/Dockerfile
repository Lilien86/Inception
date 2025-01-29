FROM debian:buster

RUN apt-get update && \
    apt-get install -y apache2 php libapache2-mod-php php-mysql php-xml php-curl php-mbstring php-zip && \
    rm -rf /var/lib/apt/lists/*

RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xvzf latest.tar.gz && \
    mv wordpress /var/www/html && \
    rm latest.tar.gz

COPY ./conf/wp-config.php /var/www/html/wordpress/wp-config.php

RUN chown -R www-data:www-data /var/www/html/wordpress

EXPOSE 80

CMD ["apache2ctl", "-D", "FOREGROUND"]
