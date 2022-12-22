#!/bin/bash

mysql_install_db --user=$MYSQL_USER > /dev/null

/etc/init.d/mysql start
if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]
then
    echo "EVERYTHING FINE ! NOTHING TO DO"
else
    mysql_secure_installation <<_EOF_
rootpass
y
rootpass
rootpass
y
n
y
y
_EOF_

echo "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" | mysql -uroot
echo "FLUSH PRIVILEGES;" | mysql -uroot
echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" | mysql -uroot
echo "GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql -uroot
echo "FLUSH PRIVILEGES;" | mysql -uroot
mysql -uroot -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE < /usr/local/bin/wordpress_db.sql



echo "Database created ! "

fi
/etc/init.d/mysql stop

exec "$@"
