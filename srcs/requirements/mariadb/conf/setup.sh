#!/bin/bash

service mariadb start
sleep 1

# Secure the installation (if needed)
mysql_secure_installation <<< "Y\nY\n$SQL_ROOT_PASSWORD\n$SQL_ROOT_PASSWORD\nY\nY\nY\nY"

# Generate the db1.sql file with the necessary SQL commands
echo "CREATE DATABASE IF NOT EXISTS $DB_NAME ;" > db1.sql
echo "CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD' ;" >> db1.sql
echo "GRANT ALL PRIVILEGES ON $dDB_NAME.* TO '$SQL_USER'@'%' ;" >> db1.sql
echo "FLUSH PRIVILEGES;" >> db1.sql

mysql -u root -p$SQL_ROOT_PASSWORD < db1.sql

# Gracefully shut down MariaDB
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

# Execute any additional commands passed to the script
"$@"
