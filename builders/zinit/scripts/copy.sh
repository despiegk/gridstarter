#!/bin/sh


set -ex

if test -f "/env.sh"; then
    source /env.sh
fi
if test -f "env.sh"; then
    source env.sh
fi


export PS1="${NAME}: "

mkdir -p /myhost/alpine/${NAME}/bin
cp /code/zinit/target/release/zinit /myhost/alpine/${NAME}/bin/

# export PATH=/root/.nsccli/bin:$PATH

echo " ** COPY DONE"



