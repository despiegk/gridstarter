
to find onlyoffice key
----------------------

```bash
#to find secret
docker exec -it onlyoffice bash
cat /etc/onlyoffice/documentserver/local.json
# supervisorctl restart all
```

```bash
docker exec onlyoffice /var/www/onlyoffice/documentserver/npm/json -f /etc/onlyoffice/documentserver/local.json 'services.CoAuthoring.secret.session.string'
```

- need key on https://www.group-office.com/account#account/contracts (professional license)
- some details on https://buildmedia.readthedocs.org/media/pdf/groupoffice/latest/groupoffice.pdf
- need to add module, then re-login and see the office module at system settings
- add the secret key from above there

links
-----

- https://helpcenter.onlyoffice.com/installation/docs-configure-jwt.aspx
- https://github.com/Intermesh/docker-groupoffice

- to connect
    - https://mail.lbndao.com/install/

Using docker compose
--------------------

Clone this repository and run from inside the directory:

````````````````````
bash groupoffice.sh
````````````````````

Then launch your browser to http://localhost:9000 and the Group-Office installer should appear.

### Cron job

You should also configure a cron job on the host machine so that Group Office can run scheduled tasks. 
   
On Linux create a file /etc/cron.d/groupoffice and add (replace /path/to/docker-groupoffice):

```cron
* * * * * root cd /path/to/docker-groupoffice && docker compose exec -T groupoffice php /usr/local/share/groupoffice/cron.php
```

> On MacOS I ran on the terminal:
>
> ```bash
> crontab -e
> ```
>
> And added:
>
> ```bash
> * * * * * cd /path/to/docker-groupoffice && docker compose exec -T groupoffice php /usr/local/share/groupoffice/cron.php
> ```

### Upgrading

Navigate in the folder with docker-compose.yml and pull the image:
```
docker compose pull
```

Bring the containers down:
```
docker compose down
```

Then start them again:
```
docker compose up -d
```
Then run http://localhost:9000/install/upgrade.php

SSL Certificates
----------------

SSL is enabled by default but it uses a self-signed certificate. You can use
a real certificate by mounting /etc/ssl/groupoffice. You can find an example in the docker-compose.yml file.

Put your certificates there and the /etc/apache2/sites-enabled/000-default.conf will
include a config file /etc/ssl/groupoffice/apache.conf. You can put the SSL directives in that file.
For example:

```
SSLCertificateKeyFile /etc/ssl/groupoffice/certificate.key
SSLCertificateFile /etc/ssl/groupoffice/certificate.crt
SSLCertificateChainFile /etc/ssl/groupoffice/cabundle.crt
```

HTTP Proxy
----------
When using a HTTP proxy to forward requests to the Docker container you need to set some headers to tell Group-Office about the real hostname. Read more about this here: https://groupoffice.readthedocs.io/en/latest/install/extras/httpproxy.html

Enable debug mode
-----------------
You can enable debug mode with this command on the host:
```
docker compose exec groupoffice sed -i "s/config\['debug'\] = false;/config\['debug'\] = true;/" /etc/groupoffice/config.php
```

Using docker cli
----------------

1. Create a "data" directory (eg. ~/Projects/docker-groupoffice-6.2/data)
2. Setup a database container that's on the default network
3. Run this command:

````
docker run --name groupoffice -d -p 6380:80 -v ~/Projects/docker-groupoffice-6.3/data:/var/lib/groupoffice --link go_db:db intermesh/groupoffice
````
