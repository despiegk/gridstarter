
# Setup

## Step 1
You need a DNS record `matrix.host.tld` pointing to matrix host/frontend proxy

## Step 2
You need a `well-known` redirection on `host.tld` (not matrix.host.tld):
 - Endpoint: https://host.tld/.well-known/matrix/server
 - Content: `{ "m.server": "matrix.host.tld:443" }`

Note: change 443 to 8448 if you don't use a frontend https proxy

## Step 3
Run `from-scratch.sh` script

```
rm -rf config/pem* config/*key

docker run --rm --entrypoint="" \
  -v $(pwd)/config:/mnt \
  matrixdotorg/dendrite-monolith:latest \
  /usr/bin/generate-keys \
  -private-key /mnt/matrix_key.pem \
  -tls-cert /mnt/server.crt \
  -tls-key /mnt/server.key

docker compose -f docker-compose.monolith.yml up
```
