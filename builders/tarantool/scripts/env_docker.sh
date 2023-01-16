set -ex

source env.sh

if [[ -z "${TNT_VER}" ]]; then 
    echo " - TNT_VER HAS NOT BEEN SET, SET FOR 2.10.0"
    export TNT_VER="2.10.0"
fi


if [[ -z "${ROCKS_INSTALLER}" ]]; then 
    echo " - ROCKS_INSTALLER HAS NOT BEEN SET"
    # export ROCKS_INSTALLER="2.10.0"
fi

if [[ -z "${NPROC}" ]]; then 
    echo " - NPROC HAS NOT BEEN SET"
    # export NPROC="2.10.0"
fi


export TARANTOOL_VERSION=${TNT_VER}
export TARANTOOL_DOWNLOAD_URL=https://github.com/tarantool/tarantool.git
export TARANTOOL_INSTALL_LUADIR=/usr/local/share/tarantool
export GPERFTOOLS_REPO=https://github.com/gperftools/gperftools.git
export GPERFTOOLS_TAG=gperftools-2.9.1
export LUAROCKS_URL=https://github.com/tarantool/luarocks/archive/6e6fe62d9409fe2103c0fd091cccb3da0451faf5.tar.gz
export LUAROCK_VSHARD_VERSION=0.1.20
export LUAROCK_AVRO_SCHEMA_VERSION=3.0.6
export LUAROCK_EXPERATIOND_VERSION=1.1.1
export LUAROCK_QUEUE_VERSION=1.2.0
export LUAROCK_CONNPOOL_VERSION=1.1.1
export LUAROCK_HTTP_VERSION=1.3.0
export LUAROCK_MEMCACHED_VERSION=1.0.1
export LUAROCK_METRICS_VERSION=0.14.0
export LUAROCK_TARANTOOL_PG_VERSION=2.0.2
export LUAROCK_TARANTOOL_MYSQL_VERSION=2.1.1
export LUAROCK_TARANTOOL_MQTT_VERSION=1.5.1
export LUAROCK_TARANTOOL_GIS_VERSION=1.0.1
export LUAROCK_TARANTOOL_PROMETHEUS_VERSION=1.0.4
export LUAROCK_TARANTOOL_GPERFTOOLS_VERSION=1.0.1