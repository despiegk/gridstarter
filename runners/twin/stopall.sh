docker ps -aq | xargs docker stop | xargs docker rm
docker container prune --force
