set -ex
source conf.sh

mkdir -p $HOME/myhost

docker rm $NAME -f > /dev/null 2>&1 
docker run --name $NAME -it -v $PWD/scripts:/scripts -v $HOME/myhost:/myhost --hostname $NAME $BNAME sh /scripts/shell.sh
# docker run --name $NAME -it -v $PWD/scripts:/scripts -v $HOME/myhost:/myhost --hostname $NAME $BNAME sh
docker rm $NAME -f > /dev/null 2>&1 

