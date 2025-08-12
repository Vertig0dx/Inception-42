FROM debian:oldstable

RUN apt-get update -y

RUN apt-get upgrade -y

RUN apt-get install php-fpm -y

RUN apt-get install php-mysql -y

RUN apt-get install curl -y

RUN apt-get install unzip-y

RUN apt-get install wget -y

RUN apt-get clean

WORKDIR /var/www/html

RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xzf latest.tar.gz && \
    rm latest.tar.gz && \
    mv wordpress/* . && \
    rm -rf wordpress

CMD ["php-fpm8.2", "-F"]