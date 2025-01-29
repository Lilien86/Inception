-- Create database
CREATE DATABASE IF NOT EXISTS wordpress_db;

-- Create user and grant privileges
CREATE USER 'wp_user'@'%' IDENTIFIED BY 'wp_password';
GRANT ALL PRIVILEGES ON wordpress_db.* TO 'wp_user'@'%';

-- Flush privileges to apply changes
FLUSH PRIVILEGES;
