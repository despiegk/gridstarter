#!/bin/sh
set -e

if test -f "/env.sh"; then
    source /env.sh
fi
if test -f "env.sh"; then
    source env.sh
fi

export PS1="${NAME}: "

# mkdir -p /myhost/alpine/nsc/bin
# cp /bin/nsc /myhost/alpine/nsc/bin/nsc

# export PATH=/root/.nsccli/bin:$PATH

# sh

echo " ** COPY DONE"



