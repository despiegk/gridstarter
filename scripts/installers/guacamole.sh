docker run --name some-guacamole --link some-guacd:guacd \
    --link some-postgres:postgres      \
    -e POSTGRES_DATABASE=guacamole_db  \
    -e POSTGRES_USER=guacamole_user    \
    -e POSTGRES_PASSWORD=some_password \
    -d -p 8080:8080 guacamole/guacamole