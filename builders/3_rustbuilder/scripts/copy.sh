#!/bin/sh


set -ex

if test -f "/env.sh"; then
    source /env.sh
fi
if test -f "env.sh"; then
    source env.sh
fi


export PS1="${NAME}: "

mkdir -p /myhost/alpine/zinit/bin
cp /code/zinit/target/release/zinit /myhost/alpine/zinit/bin/

# export PATH=/root/.nsccli/bin:$PATH

echo " ** COPY DONE"



