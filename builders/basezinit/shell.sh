set -ex
source conf.sh

mkdir -p $HOME/myhost

if [ ! "$(docker ps | grep $NAME)" ]; then
    echo "START DOCKER $NAME"
    docker rm $NAME -f > /dev/null 2>&1 
    docker run -d --name $NAME -v $PWD/scripts:/scripts -v $HOME/myhost:/myhost --hostname $NAME $BNAME
fi


docker exec -ti $NAME /bin/shell.sh