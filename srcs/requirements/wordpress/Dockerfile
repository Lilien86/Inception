FROM debian:bullseye

# Update & Install Required Packages
RUN apt update && apt install -y \
    php php-fpm php-mysql php-json php-curl php-xml php-mbstring php-zip wget tar \
    && rm -rf /var/lib/apt/lists/*

# Download and Extract WordPress
RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xvzf latest.tar.gz && \
    mv wordpress /var/www/html && \
    rm latest.tar.gz

# Copy the WordPress Configuration
COPY ./conf/wp-config.php /var/www/html/wordpress/wp-config.php

# Set Correct Permissions
RUN chown -R www-data:www-data /var/www/html/wordpress

EXPOSE 9000

CMD ["php-fpm", "-F"]
