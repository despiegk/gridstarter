set -ex

#I dont understand why this is needed
mkdir -p /var/lib/docker/volumes/dbdata/_data
mkdir -p /var/lib/docker/volumes/godata/_data
mkdir -p /var/lib/docker/volumes/goetc/_data
mkdir -p /var/lib/docker/volumes/gostudio/_data

docker compose up -d

# docker run -i -t -d -p 80:80 --restart=always onlyoffice/documentserver
# docker run -i -t -d -p 88:80 --restart=always onlyoffice/documentserver

docker run --name onlyoffice -i -t -d -p 8009:443 -p 8008:80 --restart=always \
    -v /app/onlyoffice/DocumentServer/logs:/var/log/onlyoffice  \
    -v /app/onlyoffice/DocumentServer/data:/var/www/onlyoffice/Data  \
    -v /app/onlyoffice/DocumentServer/lib:/var/lib/onlyoffice \
    -v /app/onlyoffice/DocumentServer/db:/var/lib/postgresql  onlyoffice/documentserver


# docker run -i -t -d -p 443:443 --restart=always \
#     -v /app/onlyoffice/DocumentServer/data:/var/www/onlyoffice/Data  onlyoffice/documentserver

# docker run -i -t -d -p 80:80 -p 443:443 \
#     -e LETS_ENCRYPT_DOMAIN=mail.lbndao.com -e LETS_ENCRYPT_MAIL=kristoflbndao.com  onlyoffice/documentserver \
#     -v /app/onlyoffice/DocumentServer/data:/var/www/onlyoffice/Data  onlyoffice/documentserver




