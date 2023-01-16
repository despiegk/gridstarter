set -e
source conf.sh
docker build . -t ${BNAME}:latest

docker rm $NAME -f > /dev/null 2>&1 
docker run --name $NAME -it -v $HOME/myhost:/myhost -v $PWD/scripts:/scripts --hostname $NAME $BNAME sh /scripts/copy.sh
docker rm $NAME -f > /dev/null 2>&1 