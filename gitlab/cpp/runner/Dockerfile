FROM gitlab/gitlab-runner:latest

RUN apt update -q 
RUN apt install build-essential -yq
RUN apt install cmake -yq
RUN apt install git -yq
RUN apt install lcov -yq
RUN apt install cutycapt -yq

RUN mkdir -p /usr/src/gtest 
WORKDIR /usr/src/gtest
RUN git clone https://github.com/google/googletest.git . \
    && cmake . \
    && make \
    && make install

WORKDIR /app