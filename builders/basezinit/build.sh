set -ex
source conf.sh

mkdir -p bin
rsync -rav --delete $HOME/myhost/alpine/zinit/ myhost/
docker build . -t ${BNAME} 
rm -rf myhost

# docker rm $NAME -f > /dev/null 2>&1 
# docker run --name $NAME -it -v $HOME/myhost:/myhost -v $PWD/scripts:/scripts --hostname $NAME $BNAME
#  sh /scripts/copy.sh
# docker rm $NAME -f > /dev/null 2>&1 

echo " ** INSTALL DONE"