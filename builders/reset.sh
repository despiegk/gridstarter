docker container rm -f $(docker container ls -aq)
docker image prune -a -f