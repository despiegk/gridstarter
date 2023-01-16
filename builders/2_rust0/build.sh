set -ex
source conf.sh
set +e
docker build . -t ${BNAME}
set -e
