FROM base

RUN rm  -rf /tmp/* /var/cache/apk/*
RUN apk add --no-cache git musl-dev clang gcc openssh-client make

WORKDIR /opt/vlang

RUN git clone --depth 1 https://github.com/vlang/v /opt/vlang 

RUN cd  /opt/vlang && make VFLAGS='-cc gcc' 
RUN cd  /opt/vlang && ./v -version 
RUN cd  /opt/vlang && ./v symlink

ADD scripts/* /bin/
ADD conf.sh /
