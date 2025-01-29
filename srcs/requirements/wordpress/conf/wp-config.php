<?php

// Database settings
define('DB_NAME', getenv('DB_NAME'));
define('DB_USER', getenv('DB_USER'));
define('DB_PASSWORD', getenv('DB_PASSWORD'));
define('DB_HOST', getenv('DB_HOST'));
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');

// Security keys - generate them using https://api.wordpress.org/secret-key/1.1/salt/
define('AUTH_KEY',         'k-jv[Fk:iq2_q~s.babZ-b1I8?T.tig;f>8xG_InE--- je !_!B,):q9I7emUx;');
define('SECURE_AUTH_KEY',  '42z;h[-KE,ysLc|Fz~f-G=;X{P `0KB=-g.%BDB{7KR|<jM:f]r:qIQCMcU,w6,+');
define('LOGGED_IN_KEY',    'nsflNw1B{(kke]i|CXE+t*k({?IztNM33|=?a)D!kQ,-fdOS<*IoyB-B|1|MYd=n');
define('NONCE_KEY',        ',u--fKO1w?jFyQSWmLPx+PX??76i=|.Agz-D|elg|UDq*(YFIu!c}!j5J{ex]2]P');
define('AUTH_SALT',        '9X7I`-f6~v/P9OjEW@`RJX=4k[G+QKyh~$9SXykvTp_mJ{V46cLMm>{/Uvm[H]p.');
define('SECURE_AUTH_SALT', 'MSjVnf<-{PY)oc33g^a B}c2dX{aR4-tnt6j+2<^@1&YY[e^CP=`9hHsQ_8?rjRx');
define('LOGGED_IN_SALT',   'qzAp$a2D:-4/:E%Z$gc314($|qL=8cv2:CFPjF?,=kR#Utb:L?RmIQp_`$`sYF4K');
define('NONCE_SALT',       ',a_-(d+_EAPYxKje~^v 9oR+  SUM1oiG.UZ0?hnZn_jWL6_.|  ^1,b-LmQ$:Qm');

// Table prefix
$table_prefix  = 'wp_';

// Debug mode (set to true for development)
define('WP_DEBUG', false);

// Absolute path to the WordPress directory
if ( !defined('ABSPATH') )
    define('ABSPATH', dirname(__FILE__) . '/');

// Sets up WordPress vars and included files
require_once(ABSPATH . 'wp-settings.php');
