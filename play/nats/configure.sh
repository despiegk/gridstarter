nsc edit account --name admin --js-mem-storage 1G --js-disk-storage 512M  --js-streams 10 --js-consumer 100
nsc push -A -u nats://localhost:14222
