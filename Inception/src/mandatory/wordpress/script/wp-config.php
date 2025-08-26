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

define('AUTH_KEY',         'UcViWUJmVS8uK>-K|vv42&>gcQ0D/<?. [wp5/c<0~G9;qqhTR Mi+;AITe9OnoB');

define('SECURE_AUTH_KEY',  'g$tj|{+dYQsbm<<GZ*R&|=R6g7]ob|<+kI%.nWx +nVvO1mql2BL5-5CI(+*{J&R');

define('LOGGED_IN_KEY',    '>6~*C;<SYm~y;IPE`ziQ8N{-Ns},|>@Nj%jLCLnGFh7pRIgZTK|m5^N{#kC51qT5');

define('NONCE_KEY',        'k?yX> jqyX>lti-[X(.5ulJP^5HMs7?Mq}0dQ{>M,>u1Tv3Q|skB45!XP|`HFtR(');

define('AUTH_SALT',        'LYa6GkZlOxU TW-`g`|-xu]BXxKfO1^?@jC5b]APd9N_QXW[7!<f+ko}-7!:DOMT');

define('SECURE_AUTH_SALT', 's5E*&O]kA]Ff|:*}PBZQK>uq??C^l&)DA2VCs&p9i,Fv!|vw&9z/!;bq9Jp|vH;T');

define('LOGGED_IN_SALT',   '|%upf[B-j8vRZ2*/tqBJVrSE)LO%:EAq|&<d>47QE;}K`UA(a$Jx?i4Wb)/3P$X+');

define('NONCE_SALT',       ' 8=SYqJ2z`SMPZSt;3)d-KVBkiR(@+z.@[UFwoaZkn-v8OqEQ5d9wB3W,->Ta$$t');

#redis options (REQUIRES php8.3-redis EXTENSION IN DOCKERFILE)

define('WP_REDIS_HOST', 'redis');

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