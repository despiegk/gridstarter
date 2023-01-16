FROM base0
RUN rm  -rf /tmp/* /var/cache/apk/*
# RUN apk update
# RUN apk upgrade

ARG HOME

RUN touch /etc/environment
RUN mkdir -p /etc/zinit/


# ADD zinit/* /etc/zinit/
RUN mkdir -p /etc/zinit
ADD myhost/bin/zinit /bin/zinit

# ADD scripts/* /bin/
# ADD env.sh /
# ADD conf.sh /


ENTRYPOINT ["/bin/zinit","init","--container"]


