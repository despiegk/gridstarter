set -e
source conf.sh

mkdir -p $HOME/myhost

docker rm $NAME -f > /dev/null 2>&1 
