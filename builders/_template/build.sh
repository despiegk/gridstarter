set -ex
source conf.sh

echo " ** BUILD"
set +e
docker build . -t ${BNAME}
set -e


#will start a docker and then will shutdown because of the zinit shutdown
docker rm $NAME -f > /dev/null 2>&1 
docker run --name $NAME -v $HOME/myhost:/myhost -v $PWD/scripts:/scripts -v $PWD/zinit:/etc/zinit --hostname $NAME $BNAME
docker rm $NAME -f > /dev/null 2>&1 