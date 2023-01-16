FROM base

RUN rm  -rf /tmp/* /var/cache/apk/*
RUN apk add --no-cache git musl-dev
RUN apk add --update gcc g++
RUN apk add --update go 
WORKDIR /app
ENV GOPATH /app


# ADD src /app/src
# RUN go get server # server is name of our application
# RUN CGO_ENABLED=1 GOOS=linux go install -a server

# FROM alpine:edge
# WORKDIR /app
# RUN cd /app
# COPY --from=build /app/bin/server /app/bin/server
# CMD ["bin/server"]


ADD scripts/* /bin/
ADD conf.sh /

RUN chmod 770 /bin/shell.sh
