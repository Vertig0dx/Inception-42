FROM debian:oldstable

RUN apt-get update -y

RUN apt-get upgrade -y

RUN apt-get install -y nginx

RUN apt-get install -y openssl

COPY ./cfg/config_nginx /etc/nginx/sites-enabled/default

COPY ./utils/script_nginx.sh /

RUN chmod +x /script_nginx.sh

CMD ["bash", "/script_nginx.sh"]