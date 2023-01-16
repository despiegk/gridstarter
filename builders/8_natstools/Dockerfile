FROM gobuilder

RUN rm  -rf /tmp/* /var/cache/apk/*

WORKDIR /app
ENV GOPATH /app


# ADD src /app/src
RUN CGO_ENABLED=1 GOOS=linux go install github.com/nats-io/natscli/nats@latest


ADD conf.sh /
