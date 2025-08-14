FROM debian:oldstable

RUN apt-get update -y

RUN apt-get upgrade -y

#OLDSTABLE ONLY RUNS PHP UP TO VERSION 7.4
RUN apt-get install php-fpm php-mysql -y

RUN apt-get install curl -y

RUN apt-get clean

#this line apparently makes the images slimmer... remove if issues appear, but they shouldn't.
RUN rm -rf /var/lib/apt/lists/*

COPY ./script/wordpress-script.sh /

COPY ./script/wp-config.php /

RUN chmod +x /wordpress-script.sh

CMD ["bash", "/wordpress-script.sh"]