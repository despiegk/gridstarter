FROM alpine:edge
RUN rm  -rf /tmp/* /var/cache/apk/*
RUN apk update
RUN apk upgrade
RUN apk add --no-cache redis && apk add --no-cache dumb-init 
RUN apk add --no-cache curl libssh2 git

# add openssh and clean
RUN apk add --no-cache openssh && rm  -rf /tmp/* /var/cache/apk/*

RUN apk add --no-cache mc htop rsync

# EXPOSE 22
# EXPOSE 6379

# RUN echo 'nameserver 8.8.8.8' > '/etc/resolv.conf'

ADD scripts/* /bin/
ADD env.sh /
ADD conf.sh /

RUN chmod 770 /bin/shell.sh


RUN echo 'THREEFOLD BASE DEV ENV WELCOMES YOU' > /etc/motd

# ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["/bin/shell.sh"]
