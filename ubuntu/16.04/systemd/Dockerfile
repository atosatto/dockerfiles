FROM atosatto/ubuntu:16.04

LABEL maintainer "Andrea Tosatto <andrea@tosatto.me>"

ENV container docker

# Don't start the optional systemd services. 
RUN find /etc/systemd/system \
         /lib/systemd/system \
         -path '*.wants/*' \
         -not -name '*journald*' \
         -not -name '*systemd-tmpfiles*' \
         -not -name '*systemd-user-sessions*' \
         -exec rm \{} \;

RUN systemctl set-default multi-user.target

VOLUME [ "/sys/fs/cgroup" ]

CMD ["/sbin/init"]
