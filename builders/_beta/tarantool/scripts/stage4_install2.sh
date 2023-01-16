set -ex

# mkdir -p /rocks
# echo "---------- proj (for gis module) ----------"
# wget -O proj.tar.gz http://download.osgeo.org/proj/proj-4.9.3.tar.gz
# mkdir -p /usr/src/proj
# tar -xzf proj.tar.gz -C /usr/src/proj --strip-components=1

# cd /usr/src/proj
# ./configure
# make -j ${NPROC}
# make install

# rm -r /usr/src/proj
# rm -rf /usr/src/proj
# rm -rf /proj.tar.gz

# echo "---------- geos (for gis module) ----------"

# wget -O geos.tar.bz2 http://download.osgeo.org/geos/geos-3.6.0.tar.bz2
# mkdir -p /usr/src/geos
# tar -xjf geos.tar.bz2 -C /usr/src/geos --strip-components=1

# cd /usr/src/geos
# ./configure
# make -j ${NPROC}
# make install

# rm -r /usr/src/geos
# rm -rf /usr/src/geos
# rm -rf /geos.tar.bz2

echo "---------- luarocks ----------"
echo "ldoc"
${ROCKS_INSTALLER} install ldoc
echo "lua-term"
${ROCKS_INSTALLER} install lua-term
echo "avro"
${ROCKS_INSTALLER} install avro-schema $LUAROCK_AVRO_SCHEMA_VERSION
echo "expirationd"
${ROCKS_INSTALLER} install expirationd $LUAROCK_EXPERATIOND_VERSION
echo "queue"
${ROCKS_INSTALLER} install queue $LUAROCK_QUEUE_VERSION
echo "connpool"
${ROCKS_INSTALLER} install connpool $LUAROCK_CONNPOOL_VERSION
echo "vshard"
${ROCKS_INSTALLER} install vshard $LUAROCK_VSHARD_VERSION
echo "http"
${ROCKS_INSTALLER} install http $LUAROCK_HTTP_VERSION
echo "pg"
${ROCKS_INSTALLER} install pg $LUAROCK_TARANTOOL_PG_VERSION
echo "mysql"
${ROCKS_INSTALLER} install mysql $LUAROCK_TARANTOOL_MYSQL_VERSION
echo "memcached"
${ROCKS_INSTALLER} install memcached $LUAROCK_MEMCACHED_VERSION
echo "metrics"
${ROCKS_INSTALLER} install metrics $LUAROCK_METRICS_VERSION
echo "prometheus"
${ROCKS_INSTALLER} install prometheus $LUAROCK_TARANTOOL_PROMETHEUS_VERSION
echo "mqtt"
${ROCKS_INSTALLER} install mqtt $LUAROCK_TARANTOOL_MQTT_VERSION
echo "gis"
${ROCKS_INSTALLER} install gis $LUAROCK_TARANTOOL_GIS_VERSION
echo "gperftools"
${ROCKS_INSTALLER} install gperftools $LUAROCK_TARANTOOL_GPERFTOOLS_VERSION

echo "---------- remove build deps ----------"
apk del .build-deps.2
