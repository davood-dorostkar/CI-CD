FROM gitlab/gitlab-runner:alpine

RUN apk --update add --no-cache \
    build-base \
    cmake \
    git

RUN mkdir -p /usr/src/gtest 
WORKDIR /usr/src/gtest
RUN git clone https://github.com/google/googletest.git . \
    && cmake . \
    && make \
    && make install

WORKDIR /app

# Copy the C++ project files into the container
# COPY . .

# RUN mkdir build \
#     && cd build \
#     && cmake .. \
#     && make

# ENTRYPOINT ["./build/runTests"]


# # Use an image with CMake and G++ installed
# FROM ubuntu:latest

# # Install required dependencies
# RUN apt-get update -qq \
#     && apt-get install -y -qq \
#         build-essential \
#         cmake \
#         git

# # Install Google Test
# WORKDIR /usr/src/gtest
# RUN git clone https://github.com/google/googletest.git . \
#     && cmake . \
#     && make \
#     && make install

# # Set up the working directory
# WORKDIR /app

# # Copy the C++ project files into the container
# COPY . .

# # Build the C++ project
# RUN mkdir build \
#     && cd build \
#     && cmake .. \
#     && make

# # Set the entry point to run the tests
# ENTRYPOINT ["./build/runTests"]
