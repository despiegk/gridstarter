set -ex

export VERSION='${params.version}'

wget https://ftp.postgresql.org/pub/source/v15.1/postgresql-${VERSION}.tar.gz
gunzip postgresql-${VERSION}.tar.gz
tar xf postgresql-${VERSION}.tar

mkdir -p ${postgres_path}
cd postgresql-${VERSION}
./configure --prefix='${postgres_path}'

make
make install

echo "POSTGRES SERVER INSTALLED SUCCESFULLY"
