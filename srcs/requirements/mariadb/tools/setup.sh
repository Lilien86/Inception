#!/bin/bash
mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld

echo "[i] Starting temporary MariaDB..."
mysqld_safe --skip-networking &
until mysqladmin ping --silent; do
    echo "[i] Waiting for mysqld to be up..."
    sleep 1
done
echo "[i] MariaDB is up!"

# Suppression des utilisateurs anonymes et des bases de test
mysql -u root -p"${SQL_ROOT_PASSWORD}" <<-EOSQL
    DELETE FROM mysql.user WHERE User='';
    DELETE FROM mysql.db WHERE Db='test' OR Db='test_%';
    FLUSH PRIVILEGES;
EOSQL

# Mise à jour du plugin d'authentification pour root
mysql -u root -p"${SQL_ROOT_PASSWORD}" <<-EOSQL
    ALTER USER 'root'@'localhost' IDENTIFIED VIA mysql_native_password USING PASSWORD('${SQL_ROOT_PASSWORD}');
    FLUSH PRIVILEGES;
EOSQL

# Création de la base de données et de l'utilisateur avec les droits appropriés
mysql -u root -p"${SQL_ROOT_PASSWORD}" <<-EOSQL
    CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;
    CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';
    GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%';
    FLUSH PRIVILEGES;
EOSQL

# Arrêt de l'instance temporaire et lancement en mode normal
mysqladmin -u root -p"${SQL_ROOT_PASSWORD}" shutdown
exec mysqld
