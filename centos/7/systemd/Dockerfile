FROM atosatto/centos:7

LABEL maintainer "Andrea Tosatto <andrea@tosatto.me>"

ENV container docker

# Configure systemd to run into the container (see https://hub.docker.com/_/centos/)
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;

# Install sudo and disable requiretty
RUN yum -y install sudo
RUN /usr/bin/sed -i -e 's/^\(Defaults\s*requiretty\)/#--- \1/' /etc/sudoers

VOLUME [ "/sys/fs/cgroup" ]

CMD ["/usr/sbin/init"]

