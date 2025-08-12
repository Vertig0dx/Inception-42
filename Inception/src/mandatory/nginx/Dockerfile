FROM debian:oldstable

RUN apt-get update -y

RUN apt-get upgrade -y

RUN apt-get install -y nginx

RUN apt-get install -y openssl

COPY ./utils/script_nginx.sh /

CMD ["/script_nginx.sh"]