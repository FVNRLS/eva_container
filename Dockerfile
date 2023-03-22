FROM debian:latest

# Install build essentials and compilers
RUN apt-get update && \
    apt-get install -y build-essential && \
    apt-get install -y gcc && \
    apt-get install -y g++ && \
    apt-get install -y clang && \
    apt-get install -y cppcheck && \
    apt-get install -y valgrind &&\
    apt-get install -y coreutils

# Set default working directory
WORKDIR /home

# Set default shell to bash
CMD tail -f