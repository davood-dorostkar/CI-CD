FROM ubuntu:latest

RUN apt update -qq 
RUN apt install -y -qq \
    build-essential \
    cmake \
    git \
    lcov \
    cutycapt

RUN mkdir -p /usr/src/gtest 
WORKDIR /usr/src/gtest
RUN git clone https://github.com/google/googletest.git . \
    && cmake . \
    && make \
    && make install

WORKDIR /app