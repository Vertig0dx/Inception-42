#!/bin/bash

service mysql start

echo "CREATE DATABASE IF NOT EXISTS $mysql_db_name ;" > mysql_db.sql

echo "CREATE USER IF NOT EXISTS '$mysql_db_user'@'%' IDENTIFIED BY '$mysql_db_pwd' ;" >> mysql_db.sql

echo "GRANT ALL PRIVILEGES ON $mysql_db_name.* TO '$mysql_db_user'@'%' ;" >> mysql_db.sql

echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;" >> mysql_db.sql

echo "FLUSH PRIVILEGES;" >> mysql_db.sql

mysql < mysql_db.sql

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld