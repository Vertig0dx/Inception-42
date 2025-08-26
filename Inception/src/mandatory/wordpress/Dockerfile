FROM debian:oldstable

RUN apt-get update -y

RUN apt-get upgrade -y

#OLDSTABLE ONLY RUNS PHP UP TO VERSION 8.2
RUN apt-get install php-fpm php-mysql php-mysqli -y

RUN apt-get install mariadb-client -y

RUN apt-get install php-redis -y

RUN apt-get install curl -y

RUN apt-get clean

#this line apparently makes the images slimmer... remove if issues appear, but they shouldn't.
RUN rm -rf /var/lib/apt/lists/*

COPY ./script/wordpress-script.sh /

#RUN wp config create --dbname="$WORDPRESS_DB_NAME" --dbuser"$WORDPRESS_DB_USER" --dbpass="$WORDPRESS_DB_PASSWORD" --dbhost="$WORDPRESS_DB_HOST" --allow-root

COPY ./script/wp-config.php /

RUN chmod +x /wordpress-script.sh

RUN sed -i 's/^;clear_env = no/clear_env = no/' /etc/php/8.2/fpm/pool.d/www.conf

CMD ["/wordpress-script.sh"]