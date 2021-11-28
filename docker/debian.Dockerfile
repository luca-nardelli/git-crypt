FROM debian:buster as builder

#Global deps
RUN apt-get update && apt-get install -y build-essential libssl-dev

RUN mkdir -p /tmp/build

COPY . /tmp/build

RUN cd /tmp/build && make -j$(ncpu)