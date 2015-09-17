FROM alpine:3.2
MAINTAINER Eryx Lee <eryx.lee0901@gmail.com>

RUN apk --update add \
    bash \
    build-base \
    clang \
    openssl-dev

VOLUME /source

ADD https://www.python.org/ftp/python/3.5.0/Python-3.5.0.tgz /source/Python-3.5.0.tgz

RUN cd source && tar -zxvf Python-3.5.0.tgz && cd Python-3.5.0 && ./configure && make && make install

CMD ["python3"]
