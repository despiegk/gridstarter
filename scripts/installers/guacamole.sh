docker run --name some-guacd -d -p 4822:4822 guacamole/guacd

docker run --name some-guacamole --link some-guacd:guacd \
    -e MYSQL_DATABASE=guacamole_db  \
    -e MYSQL_USER=guacamole    \
    -e MYSQL_PASSWORD=guacamole \
    -e MYSQL_HOSTNAME=10.20.2.2  \
    -e GUACD_HOSTNAME=10.20.2.2  \
    -e GUACD_PORT=4822             \
    -d -p 8080:8080 guacamole/guacamole

        --link  groupoffice-db-1:mysql         \

#populate DB (uses the docker compose for groupoffice)
docker run --rm guacamole/guacamole /opt/guacamole/bin/initdb.sh --mysql > initdb.sql
mysql -h 127.0.0.1  -P 3306  -p groupoffice -u root --password=groupoffice -e "CREATE DATABASE guacamole_db"
mysql -h 127.0.0.1  -P 3306  -p guacamole_db -u root --password=groupoffice < initdb.sql
mysql -h 127.0.0.1  -P 3306  -p guacamole_db -u root --password=groupoffice -e "SHOW TABLES;"


mysql -h 127.0.0.1  -P 3306  -p groupoffice -u root --password=groupoffice -e "CREATE USER 'guacamole'@'localhost' IDENTIFIED BY 'guacamole';GRANT SELECT,INSERT,UPDATE,DELETE ON guacamole_db.* TO 'guacamole'@'localhost';FLUSH PRIVILEGES;"

http://mail.lbndao.com:8080/guacamole/