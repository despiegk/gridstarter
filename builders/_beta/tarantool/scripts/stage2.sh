set -ex

apk add --no-cache --virtual .build-deps.1 \
    gcc \
    g++ \
    cmake \
    file \
    readline-dev \
    openssl-dev \
    yaml-dev \
    bsd-compat-headers \
    lz4-dev \
    zlib-dev \
    binutils-dev \
    ncurses-dev \
    lua-dev \
    musl-dev \
    make \
    git \
    libunwind-dev \
    autoconf \
    automake \
    libtool \
    linux-headers \
    go \
    icu-dev \
    wget