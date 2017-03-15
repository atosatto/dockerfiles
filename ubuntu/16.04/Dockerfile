FROM ubuntu:16.04

LABEL maintainer "Andrea Tosatto <andrea@tosatto.me>"

# Install some extra packages
RUN apt-get update && \
    apt-get dist-upgrade --yes --force-yes && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    iproute2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

VOLUME [ "/sys/fs/cgroup" ]

CMD ["/sbin/init"]
