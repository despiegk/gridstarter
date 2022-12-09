apt install mysql-client -y

mysql -h 127.0.0.1  -P 3306  -p groupoffice -u root --password=groupoffice -e "CREATE DATABASE guacamole_db"