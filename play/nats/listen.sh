cd /Users/despiegk1/code4/nats
source env.sh

echo see: https://github.com/bmcustodio/docker-compose-nats-cluster

nats-pub -s nats://127.0.0.1:24222 foo bar1
nats-pub -s nats://127.0.0.1:34222 foo bar2
nats-sub -s nats://127.0.0.1:14222 foo
