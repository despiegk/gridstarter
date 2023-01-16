set -ex

export NAME='twin-tools-1'
export BNAME='base'

mkdir -p $HOME/myhost

docker rm $NAME -f > /dev/null 2>&1 
docker run --name $NAME -it -v $PWD/scripts:/scripts -v $HOME/myhost:/myhost --hostname $NAME $BNAME /bin/shell.sh
docker rm $NAME -f > /dev/null 2>&1 

