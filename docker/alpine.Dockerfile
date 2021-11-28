FROM alpine:3.12 as builder

#Global deps
RUN apk add --update --no-cache build-base 

RUN mkdir -p /tmp/build

COPY . /tmp/build

RUN cd /tmp/build && make -j$(ncpu)