<?php

#mysql settings



#database name
define('DB_NAME', getenv('WORDPRESS_DB_NAME'));

#database username
define('DB_USER', getenv('WORDPRESS_DB_USER'));

#database password
define('DB_PASSWORD', getenv('WORDPRESS_DB_PASSWORD'));

#database hostname
define('DB_HOST', getenv('WORDPRESS_DB_HOST'));

#error_log('WORDPRESS_DB_HOST=' . getenv('WORDPRESS_DB_HOST'));
#error_log('WORDPRESS_DB_USER=' . getenv('WORDPRESS_DB_USER'));
#error_log('WORDPRESS_DB_PASSWORD=' . getenv('WORDPRESS_DB_PASSWORD'));
#error_log('WORDPRESS_DB_NAME=' . getenv('WORDPRESS_DB_NAME'));

#database charset, utf8mb4 for unicode support (non-latin characters, for example)
define('DB_CHARSET', 'utf8mb4');

#database collate, basically indicates how data is stored and compared. leave default for best results...
define('DB_COLLATE', '');

#allows access to "wp-admin/maint/repair.php", useful for fixing and troubleshooting. (normally used for fixing corrupted databases)
define('WP_ALLOW_REPAIR', true);

//generate new keys, these are generated using 'salt' at https://api.wordpress.org/secret-key/1.1/salt/

//WARNING: CHANGING ANY OF THESE KEYS WILL FORCE A USER TO LOGIN AGAIN AND ERASE ALL COOKIES. USER DISCRETION IS ADVISED.

define('AUTH_KEY', getenv('AUTH_KEY'));

define('SECURE_AUTH_KEY', getenv('SECURE_AUTH_KEY'));

define('LOGGED_IN_KEY', getenv('LOGGED_IN_KEY'));

define('NONCE_KEY', getenv('NONCE_SALT'));

define('AUTH_SALT', getenv('AUTH_SALT'));

define('SECURE_AUTH_SALT', getenv('SECURE_AUTH_SALT'));

define('LOGGED_IN_SALT', getenv('LOGGED_IN_SALT'));

define('NONCE_SALT', getenv('NONCE_SALT'));

#redis options (REQUIRES php8.3-redis EXTENSION IN DOCKERFILE)

define('WP_REDIS_HOST', getenv('WORDPRESS_REDIS_HOST'));

define('WP_REDIS_PORT', 6379);

define('WP_CACHE', true);

#sets a prefix for all wordpress installs in the same DB

$table_prefix = 'wp_';

#allows debug mode

define('WP_DEBUG', true);

#sets the absolute path to the wordpress install directory, in this case 'wp-settings.php'

if (!defined( 'ABSPATH') ) {
    define( 'ABSPATH', __DIR__ . '/' );
}

require_once ABSPATH . 'wp-settings.php';

?>