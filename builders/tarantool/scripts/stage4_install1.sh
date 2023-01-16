set -x

apk add --no-cache --virtual .run-deps.2 \
    mariadb-connector-c-dev \
    libpq \
    cyrus-sasl \
    libev

apk add --no-cache --virtual .build-deps.2 \
    git \
    cmake \
    make \
    coreutils \
    gcc \
    g++ \
    postgresql-dev \
    lua-dev \
    musl-dev \
    cyrus-sasl-dev \
    libev-dev \
    libucontext \
    libucontext-dev \
    libressl-dev \
    wget \
    unzip

