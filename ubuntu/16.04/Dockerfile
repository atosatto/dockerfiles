FROM ubuntu:16.04

MAINTAINER Andrea Tosatto <andrea@tosatto.me>

# Install some extra packages
RUN apt-get update -y \
  && apt-get install -y iproute2 \
  && rm -rf /var/lib/apt/lists/*
