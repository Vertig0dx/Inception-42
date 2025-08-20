#!/bin/bash

#IMPORTANT LINE, CAUSES SCRIPT TO EXIT IMMEDIATELY SHOULD ANY LINE FAILS (very useful)
set -e

#sets up permissions in data directories
chown -R mysql:mysql /var/lib/mysql /var/run/mysqld

#check if /var/lib/mysql/(database name) exists, initialize if it doesn't
if [ ! -d "/var/lib/mysql/${MYSQL_DATABASE}" ]; then
    echo "Initializing mariadb;"

#starts mariadb in the background (using '&') in safe mode
    mysqld_safe --datadir=/var/lib/mysql &

#pings mysqladmin to check if it is ready to receive commands
    while ! mysqladmin ping --silent; do
        echo "Waiting for response from mariadb..."
        sleep 1
    done

    echo "Response received, setting up user and associated database."

#the following lines are SQL commands, ran as root user:
#CREATE DATABASE - creates a wordpress database (db)
#CREATE USER - creates a wordpress db user
#GRANT ALL PRIVILEGES - self explanatory, grants user full access
#ALTER USER - changes user password, in this case altering the root password to '12345'
#FLUSH PRIVILEGES - forces the permissions table to update

    if mysql -u root -e "SELECT 1;" &> /dev/null; then
        MYSQL_CMD="mysql -u root"
    else
        MYSQL_CMD="mysql -u root -p12345"
    fi

    $MYSQL_CMD<<EOF

CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '12345';
FLUSH PRIVILEGES;
EOF

    echo "Shutting down mariadb setup."
    mysqladmin -u root -p12345 shutdown
fi

#starts mariadb
exec mysqld_safe --datadir=/var/lib/mysql