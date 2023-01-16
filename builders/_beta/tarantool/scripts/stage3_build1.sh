set -x            
echo "---------- gperftools ----------"
mkdir -p /usr/src/gperftools
git clone "$GPERFTOOLS_REPO" /usr/src/gperftools
git -C /usr/src/gperftools checkout "$GPERFTOOLS_TAG"
cd /usr/src/gperftools
./autogen.sh
./configure --disable-libunwind --enable-frame-pointers
make -j ${NPROC}
cp .libs/libprofiler.so* /usr/local/lib/
echo "---------- pprof for gperftools ----------"
echo "To avoid of the issue:"
echo "'The master branch is Incompatible with go version < 1.13 #538'"
echo "https://github.com/google/pprof/issues/538"
echo "use latest workable commits with the old GO versions"
export GOPATH=/root/go
export PATH=${GOPATH}/bin:/usr/local/go/bin:$PATH
export GOBIN=$GOROOT/bin
mkdir -p ${GOPATH}/src ${GOPATH}/bin
go install github.com/google/pprof@latest
echo "---------- tarantool ----------"
mkdir -p /usr/src/tarantool
git clone "$TARANTOOL_DOWNLOAD_URL" /usr/src/tarantool
git -C /usr/src/tarantool checkout "$TARANTOOL_VERSION"
git -C /usr/src/tarantool submodule update --init --recursive

cd /usr/src/tarantool
echo "WARNING: Temporary fix for test/unit/cbus_hang test"
git cherry-pick d7fa6d34ab4e0956fe8a80966ba628e0e3f81067 2>/dev/null || git cherry-pick --abort
cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo\
             -DENABLE_BUNDLED_LIBYAML:BOOL=${ENABLE_BUNDLED_LIBYAML}\
             -DENABLE_BACKTRACE:BOOL=ON\
             -DLUAJIT_DISABLE_SYSPROF:BOOL=${LUAJIT_DISABLE_SYSPROF}
             -DLUAJIT_ENABLE_GC64:BOOL=${GC64}
             -DENABLE_DIST:BOOL=ON

make -C /usr/src/tarantool -j ${NPROC}
make -C /usr/src/tarantool install
make -C /usr/src/tarantool clean

echo "---------- luarocks ----------"

wget -O luarocks.tar.gz "$LUAROCKS_URL"
mkdir -p /usr/src/luarocks
tar -xzf luarocks.tar.gz -C /usr/src/luarocks --strip-components=1

cd /usr/src/luarocks
./configure
make -j ${NPROC} build
make install
rm -r /usr/src/luarocks
rm -rf /usr/src/tarantool
rm -rf /usr/src/gperftools
rm -rf /usr/src/go

echo "---------- remove build deps ----------"
apk del .build-deps.1

