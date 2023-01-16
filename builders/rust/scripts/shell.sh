#!/bin/sh

cp /conf.sh .

set -e

source /env.sh
# redis-server /etc/redis.conf  --daemonize yes

export PS1="${NAME}: "

# export PATH=/root/.nsccli/bin:$PATH

sh



