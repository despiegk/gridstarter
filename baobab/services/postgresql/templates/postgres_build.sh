set -ex


cd /tmp

wget https://ftp.postgresql.org/pub/source/v15.1/postgresql-${version}.tar.gz
gunzip postgresql-${version}.tar.gz
tar xf postgresql-${version}.tar

mkdir -p ${postgres_path}
cd postgresql-${version}
./configure --prefix='${postgres_path}'

make
make install

rm -rf ${postgres_path}/include

echo "postgresql SERVER INSTALLED SUCCESFULLY"
