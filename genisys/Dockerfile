FROM php:7.0-zts

LABEL MAINTAINER="Andrea Tosatto <andrea@tosatto.me>"

# installing genisys dependencies
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    unzip \
    libyaml-0-2  \
    libyaml-dev \
  && pecl install \
    pthreads-3.1.6 \
    yaml-2.0.0 \
    weakref-0.3.2 \
  && docker-php-ext-enable \
    pthreads \
    yaml \
    weakref \
  && docker-php-ext-install \
    sockets \
    opcache \
    bcmath \
    pcntl \
  && rm -r /var/lib/apt/lists/*

WORKDIR /genisys
VOLUME [ "/genisys/config" ]
VOLUME [ "/genisys/plugins" ]

COPY docker-start.sh /genisys/start.sh
COPY php.ini /genisys/php.ini
COPY server.properties /genisys/server.properties

# add the genisys user, group and workdir
RUN groupadd --system genisys \
  && useradd --system --gid genisys --home-dir /genisys genisys \
  && chown -R genisys:genisys /genisys

USER genisys

ENV GENISYS_VERSION 0.16.0-alpha
ENV GENISYS_DOWNLOAD_URL https://gitlab.com/itxtech/genisys/builds/artifacts/master/download?job=phar

ENTRYPOINT ["./start.sh"]

RUN curl -L -o genisys.zip $GENISYS_DOWNLOAD_URL \
  && unzip genisys.zip \
  && find . -name *.phar | xargs -I {} mv {} genisys.phar \
  && rm -f genisys.zip

EXPOSE 19132

CMD ["php", "-c", "php.ini", "genisys.phar"]
