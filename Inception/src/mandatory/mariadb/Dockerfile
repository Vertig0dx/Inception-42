FROM debian:oldstable

RUN apt-get update -y 

RUN apt-get install mariadb-server -y

COPY ./script/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./script/mariadb-script.sh /

RUN chmod +x /mariadb-script.sh

#normal sql
RUN mkdir -p /var/lib/mysql && chown -R mysql:mysql /var/lib/mysql

#daemon sql
RUN mkdir -p /var/run/mysqld && chown -R mysql:mysql /var/run/mysqld

#CMD ["tail", "-f"]
CMD ["bash", "/mariadb-script.sh"]