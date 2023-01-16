set -x
source conf.sh

mkdir -p bin
rsync -rav --delete $HOME/myhost/alpine/zinit/ myhost/
set +e
docker build . -t ${BNAME} 
set -e
rm -rf myhost


echo " ** INSTALL DONE"