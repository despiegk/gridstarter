FROM alpine:3.11.5

# VERSIONS
ENV ALPINE_VERSION=3.11 \
    PYTHON_VERSION=3.8.2

# PATHS

RUN apk add vino@community xrdp

# COPY extend.sh /tmp/extend.sh
# RUN sh /tmp/extend.sh

# since we will be "always" mounting the volume, we can set this up
ENTRYPOINT ["/usr/bin/dumb-init"]
# CMD ["python"]