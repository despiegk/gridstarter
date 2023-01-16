#!/bin/sh
set -e

cp /conf.sh .
source /env.sh

export PS1="${NAME}: "

mkdir -p /myhost/alpine/${NAME}/bin
cp /app/bin/* /myhost/alpine/${NAME}/bin/

# export PATH=/root/.nsccli/bin:$PATH

# sh

echo " ** COPY DONE"



