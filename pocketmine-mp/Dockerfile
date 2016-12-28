FROM php:5.6-zts-alpine

LABEL MAINTAINER="Andrea Tosatto <andrea@tosatto.me>"

# installing base tools
RUN apk add --no-cache --update \
  ca-certificates \
  openssl \
  yaml-dev

# installing pocketmine dependencies
RUN apk add --no-cache --virtual .build-deps \
    perl \
    gcc \
    g++ \
    make \
    automake \
    libtool \
    autoconf \
    m4 \
  && pecl install \
    # PHP 5.6
    pthreads-2.0.10 \
    yaml-1.3.0 \
    weakref-0.2.6 \
    # PHP 7.0
    # pthreads-3.1.6 \
    # yaml-2.0.0 \
    # weakref-0.3.2 \
  && docker-php-ext-enable \
    pthreads \
    yaml \
    weakref \
  && docker-php-ext-install \
    sockets \
    opcache \
    bcmath \
    pcntl \
  && apk del .build-deps

WORKDIR /pocketmine
VOLUME [ "/pocketmine/config" ]
VOLUME [ "/pocketmine/plugins" ]

COPY docker-start.sh /pocketmine/start.sh
COPY php.ini /pocketmine/php.ini
COPY server.properties /pocketmine/server.properties

# add the pocketmine user, group and workdir
RUN addgroup -S pocketmine \
  && adduser -S -G pocketmine -h /pocketmine pocketmine \
  && chown -R pocketmine:pocketmine /pocketmine

USER pocketmine

ENV POCKETMINE_VERSION 1.4.1
ENV POCKETMINE_DOWNLOAD_URL https://github.com/PocketMine/PocketMine-MP/releases/download/1.4.1/PocketMine-MP_1.4.1.phar

ENTRYPOINT ["./start.sh"]

RUN wget -q -O PocketMine-MP.phar $POCKETMINE_DOWNLOAD_URL

EXPOSE 19132

CMD ["php", "-c", "php.ini", "PocketMine-MP.phar"]
