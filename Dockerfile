FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
    build-essential 

WORKDIR /work

COPY ./test.c /work/test.c

RUN gcc test.c -o test
