#!/bin/sh
set -e

if test -f "/env.sh"; then
    source /env.sh
fi
if test -f "env.sh"; then
    source env.sh
fi


export PS1="${NAME}: "

# export PATH=/root/.nsccli/bin:$PATH

sh




