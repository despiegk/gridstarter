docker ps -aq | xargs docker stop | xargs docker rm
docker container prune --force
docker image prune -a --force
rm -rf /var/lib/docker/volumes/*
