#!/bin/bash
set -e

# 1) Wait for MariaDB to be ready, using root credentials
echo "Waiting for MariaDB to be ready..."
while ! mysqladmin ping -h mariadb -u "$SQL_USER" -p"$SQL_PASSWORD" --silent; do
    sleep 1
done
echo "MariaDB is ready!"

cd /var/www/html

# 2) If wp-config.php doesn't exist, configure WordPress
if [ ! -f wp-config.php ]; then

    # Download WP-CLI if not present
    if [ ! -f /usr/local/bin/wp ]; then
        echo "Downloading WP-CLI..."
        curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
        chmod +x wp-cli.phar
        mv wp-cli.phar /usr/local/bin/wp
    fi

    echo "Creating wp-config..."
    wp config create \
        --dbname="$SQL_DATABASE" \
        --dbuser="$SQL_USER" \
        --dbpass="$SQL_PASSWORD" \
        --dbhost=mariadb \
        --path=/var/www/html \
        --allow-root

    echo "Installing WordPress..."
    wp core install \
        --url="$FULL_URL" \
        --title="$WP_TITLE" \
        --admin_user="$WP_ADMIN_NAME" \
        --admin_password="$WP_ADMIN_PASSWORD" \
        --admin_email="$WP_ADMIN_EMAIL" \
        --path=/var/www/html \
        --skip-email \
        --allow-root

    echo "Creating a standard user..."
    wp user create \
        "$WP_USER_NAME" "$WP_USER_EMAIL" \
        --user_pass="$WP_USER_PASSWORD" \
        --role=author \
        --path=/var/www/html \
        --allow-root
fi

# 3) Ensure proper permissions
chown -R www-data:www-data /var/www/html

# 4) Launch PHP-FPM in the foreground
echo "Starting php-fpm..."
exec php-fpm7.4 -F
