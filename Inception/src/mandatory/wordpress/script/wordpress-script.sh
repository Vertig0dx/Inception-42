#!/bin/bash

#create directory structure for nginx and wordpress files

mkdir -p /var/www/html

chown -R root:root /var/www/html

chmod -R 755 /var/www/html

cd /var/www/html

rm -rf *

#download wp-cli, a tool for managing wordpress through a command line interface

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

#give executable rights to wp-cli.phar

chmod +x wp-cli.phar

#move it into system path for global use of "wp"

mv wp-cli.phar /usr/local/bin/wp

#download wordpress core files to current directory (will attempt 1 time, if it fails it displays an error.)
#not sure if --path flag is redundant or not but the installation of WP was being lost somewhere so I placed it to troubleshoot.
RETRY_COUNT=5

until wp core download --path=/var/www/html --allow-root; do
    RETRY_COUNT=$((RETRY_COUNT - 1))
    echo "Retrying wp core download in 5 seconds"
    sleep 5

    if [ "$RETRY_COUNT" -le 0 ]; then
        echo "wp core download failure after 5 attempt, aborting."
        exit 1
    fi
done

#copy the default sample config to a real config file

cp /wp-config.php /var/www/html/wp-config.php

#if [ ! -f var/www/html/wp-config.php] ; then

#    wp config create --dbname="$WORDPRESS_DB_NAME" --dbuser"$WORDPRESS_DB_USER" --dbpass="$WORDPRESS_DB_PASSWORD" --dbhost="$WORDPRESS_DB_HOST" --allow-root

#wait for mariadb to be ready...
echo "Awaiting mariadb signal..."

until mysqladmin ping -h"mariadb" -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" --silent; do
    echo "no signal from mariadb, sleeping it off..."
    sleep 2
done

echo "mariadb signal received, resuming wordpress setup."

#run the final wordpress instalation with site url, site title, admin credentials, skipping email confirmation and allowing root access

wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

#create a regular user in addition to the admin created during final wordpress instalation

wp user create "$WP_USER" "$WP_EMAIL" --role=author --user_pass="$WP_PWD" --allow-root

#install a lightweight wordpress theme, Astra

wp theme install astra --activate --allow-root

#install the Redis object cache plugin

wp plugin install redis-cache --activate --allow-root

#update all plugins to current latest version

wp plugin update --all --allow-root

#modifies PHP-FPM to listen on tcp port 9000

sed -i 's/listen = \/run\/php\/php8.2-fpm.sock/listen = 9000/g' /etc/php/8.2/fpm/pool.d/www.conf

#test for runtime directory, creates it if it doesn't exist (it should exist already)

mkdir -p /run/php

#enables redis

wp redis enable --allow-root

#runs php in background

php-fpm8.2 -F