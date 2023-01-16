set -ex

apk add --no-cache --virtual .run-deps.1\
    libstdc++ \
    readline \
    openssl \
    yaml \
    lz4 \
    binutils \
    ncurses \
    libgomp \
    lua \
    tar \
    zip \
    zlib \
    libunwind \
    icu \
    ca-certificates