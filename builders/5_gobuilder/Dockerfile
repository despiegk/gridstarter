FROM base

RUN rm  -rf /tmp/* /var/cache/apk/*
RUN apk add --no-cache git musl-dev
RUN apk add --update gcc g++
RUN apk add --update go 
WORKDIR /app
ENV GOPATH /app

ADD scripts/* /scripts/
ADD conf.sh /

