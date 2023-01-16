FROM base
RUN rm  -rf /tmp/* /var/cache/apk/*
# RUN apk update
# RUN apk upgrade

ARG HOME

RUN touch /etc/environment
RUN mkdir -p /etc/zinit/


ADD zinit/* /etc/zinit/
ADD myhost/bin/zinit /bin/zinit

ADD scripts/* /bin/
ADD env.sh /
ADD conf.sh /

RUN chmod 770 /bin/shell.sh

ENTRYPOINT ["/bin/zinit","init","--container"]

# CMD ["/bin/shell.sh"]
