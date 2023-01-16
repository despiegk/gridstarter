set -ex
source conf.sh
docker rmi ${BNAME} -f
set +e
docker build . -t ${BNAME}
set -e
