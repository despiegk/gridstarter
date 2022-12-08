docker compose rm -s -v
rm -rf /var/lib/docker/volumes/docker-groupoffice_dbdata
rm -rf /var/lib/docker/volumes/docker-groupoffice_godata
rm -rf /var/lib/docker/volumes/docker-groupoffice_goetc
mkdir -p /var/lib/docker/volumes/docker-groupoffice_dbdata/_data
mkdir -p /var/lib/docker/volumes/docker-groupoffice_godata/_data
mkdir -p /var/lib/docker/volumes/docker-groupoffice_goetc/_data
docker compose up -d

# docker run -i -t -d -p 80:80 --restart=always onlyoffice/documentserver
# docker run -i -t -d -p 88:80 --restart=always onlyoffice/documentserver

# docker run -i -t -d -p 8009:443 -p 8008:80 --restart=always \
#     -v /app/onlyoffice/DocumentServer/logs:/var/log/onlyoffice  \
#     -v /app/onlyoffice/DocumentServer/data:/var/www/onlyoffice/Data  \
#     -v /app/onlyoffice/DocumentServer/lib:/var/lib/onlyoffice \
#     -v /app/onlyoffice/DocumentServer/db:/var/lib/postgresql  onlyoffice/documentserver


# docker run -i -t -d -p 443:443 --restart=always \
#     -v /app/onlyoffice/DocumentServer/data:/var/www/onlyoffice/Data  onlyoffice/documentserver

# docker run -i -t -d -p 80:80 -p 443:443 \
#     -e LETS_ENCRYPT_DOMAIN=mail.lbndao.com -e LETS_ENCRYPT_MAIL=kristoflbndao.com  onlyoffice/documentserver \
#     -v /app/onlyoffice/DocumentServer/data:/var/www/onlyoffice/Data  onlyoffice/documentserver



#to find secret
docker exec -it tender_ganguly bash
mcedit /etc/onlyoffice/documentserver/local.json
supervisorctl restart all

https://helpcenter.onlyoffice.com/installation/docs-configure-jwt.aspx
https://github.com/Intermesh/docker-groupoffice


#to connect
https://mail.lbndao.com:8001/install/