FROM alpine:latest
LABEL org.opencontainers.image.authors="artembo@me.com; piligrim@rootnix.net"

RUN addgroup -S tarantool \
    && adduser -S -G tarantool tarantool \
    && apk add --no-cache 'su-exec>=0.2'

# An ARG instruction goes out of scope at the end of the build
# stage where it was defined. To use an arg in multiple stages,
# each stage must include the ARG instruction
ARG TNT_VER
ARG NPROC

COPY files/gperftools_alpine.diff /

ARG ENABLE_BUNDLED_LIBYAML \
    LUAJIT_DISABLE_SYSPROF \
    GC64

ADD scripts/* /tmp/
# ADD "../env.sh" /tmp/

RUN cd /tmp && source env.sh && sh stage1.sh
RUN cd /tmp && source env.sh && sh stage2.sh
RUN cd /tmp && source env.sh && sh stage3_build1.sh

RUN mkdir -p /usr/local/etc/luarocks \
    && mkdir -p /usr/local/etc/tarantool/rocks

COPY files/luarocks-config.lua /usr/local/etc/luarocks/config-5.1.lua
COPY files/luarocks-config.lua /usr/local/etc/tarantool/rocks/config-5.1.lua

ARG ROCKS_INSTALLER


RUN cd /tmp && source env.sh && sh stage4_install1.sh
RUN cd /tmp && source env.sh && sh stage4_install2.sh

# gh-170: needed for luarocks
RUN apk update \
    && apk add wget git libucontext

RUN mkdir -p /var/lib/tarantool \
    && chown tarantool:tarantool /var/lib/tarantool \
    && mkdir -p /opt/tarantool \
    && chown tarantool:tarantool /opt/tarantool \
    && mkdir -p /var/run/tarantool \
    && chown tarantool:tarantool /var/run/tarantool \
    && mkdir /etc/tarantool \
    && chown tarantool:tarantool /etc/tarantool

VOLUME /var/lib/tarantool
WORKDIR /opt/tarantool

COPY files/tarantool-entrypoint.lua /usr/local/bin/
COPY files/tarantool_set_config.lua /usr/local/bin/
COPY files/docker-entrypoint.sh /usr/local/bin/
COPY files/console /usr/local/bin/
COPY files/tarantool_is_up /usr/local/bin/
COPY files/tarantool.default /usr/local/etc/default/tarantool

RUN ln -s usr/local/bin/docker-entrypoint.sh /entrypoint.sh # backwards compat
ENTRYPOINT ["docker-entrypoint.sh"]

HEALTHCHECK CMD tarantool_is_up

EXPOSE 3301

CMD [ "tarantool" ]