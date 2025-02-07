FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y \
    iproute2 \
    iptables \
    wget \
    curl \
    mariadb-client \
    php7.4 \
    php7.4-fpm \
    php7.4-mysql \
    php7.4-curl \
    php7.4-gd \
    php7.4-xml \
    php7.4-zip \
    php7.4-mbstring \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/www/html && \
    wget https://wordpress.org/latest.tar.gz && \
    tar -xzf latest.tar.gz --strip-components=1 -C /var/www/html && \
    rm latest.tar.gz

COPY conf/wp-config.conf /etc/php/7.4/fpm/pool.d/wp-config.conf

# Modify PHP-FPM to listen on TCP port instead of Unix socket
RUN sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = 9000|' /etc/php/7.4/fpm/pool.d/www.conf

# Ensure the PHP-FPM run directory exists
RUN mkdir -p /run/php

# Set correct permissions for the WordPress directory
RUN chown -R www-data:www-data /var/www/html

# Install WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

COPY tools/setup.sh /usr/local/bin/setup.sh
RUN chmod +x /usr/local/bin/setup.sh

WORKDIR /var/www/html

EXPOSE 9000

CMD ["/usr/local/bin/setup.sh"]