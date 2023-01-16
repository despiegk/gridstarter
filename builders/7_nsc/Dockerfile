FROM base

ADD conf.sh /

RUN rm  -rf /tmp/* /var/cache/apk/*

RUN cd /tmp && curl -LO https://raw.githubusercontent.com/nats-io/nsc/main/install.sh
RUN cd /tmp && sh ./install.sh
RUN mv ~/.nsccli/bin/nsc /bin && rm -rf ~/.nsccli


# WORKDIR /opt/vlang


