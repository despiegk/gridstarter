set -ex
docker compose down
docker compose rm -s -v
rm -rf /var/lib/docker/volumes/docker-groupoffice*
rm -rf /var/lib/docker/volumes/groupoffice*
# mkdir -p /var/lib/docker/volumes/docker-groupoffice_dbdata/_data
# mkdir -p /var/lib/docker/volumes/docker-groupoffice_godata/_data
# mkdir -p /var/lib/docker/volumes/docker-groupoffice_goetc/_data

