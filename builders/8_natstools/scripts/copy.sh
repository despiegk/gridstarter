#!/bin/sh
set -e

if test -f "/env.sh"; then
    source /env.sh
fi
if test -f "env.sh"; then
    source env.sh
fi


export PS1="${NAME}: "

mkdir -p /myhost/alpine/${NAME}/bin
cp /app/bin/* /myhost/alpine/${NAME}/bin/

# export PATH=/root/.nsccli/bin:$PATH

# sh

echo " ** COPY DONE"



