<?php
// Database Configuration
define( 'DB_NAME', 'db1' );
define( 'DB_USER', 'user' );
define( 'DB_PASSWORD', 'pwd' );
define( 'DB_HOST', 'mariadb' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );

define( 'WP_ALLOW_REPAIR', true );

// Security Keys & Salts
define( 'AUTH_KEY', 'your-random-key' );
define( 'SECURE_AUTH_KEY', 'your-random-key' );
define( 'LOGGED_IN_KEY', 'your-random-key' );
define( 'NONCE_KEY', 'your-random-key' );
define( 'AUTH_SALT', 'your-random-key' );
define( 'SECURE_AUTH_SALT', 'your-random-key' );
define( 'LOGGED_IN_SALT', 'your-random-key' );
define( 'NONCE_SALT', 'your-random-key' );

// Redis Caching
define( 'WP_REDIS_HOST', 'redis' );
define( 'WP_REDIS_PORT', 6379 );
define('WP_CACHE', true);

// Table Prefix
$table_prefix = 'wp_';

// Debug Mode
define( 'WP_DEBUG', true );

// WordPress Path
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}
require_once ABSPATH . 'wp-settings.php';
?>
