FROM rust0

RUN rm  -rf /tmp/* /var/cache/apk/*

RUN apk add --no-cache git musl-dev

RUN rm -rf /code && mkdir -p /code && cd /code && git clone https://github.com/threefoldtech/zinit    

# RUN cd /code/zinit && cargo build --release --target=x86_64-unknown-linux-musl
RUN cd /code/zinit && cargo build --release

RUN cp /code/zinit/target/release/zinit /bin/

RUN rm -f /conf.sh

ADD scripts/* /bin/
ADD conf.sh /

RUN chmod 770 /bin/shell.sh
