FROM openjdk:8-jre-alpine

LABEL MAINTAINER="Andrea Tosatto <andrea@tosatto.me>"

# installing base tools
RUN apk add --no-cache --update \
  ca-certificates \
  openssl

WORKDIR /nukkit
VOLUME [ "/nukkit/config" ]
VOLUME [ "/nukkit/plugins" ]

COPY docker-start.sh /nukkit/start.sh
COPY nukkit.yml /nukkit/nukkit.yml
COPY server.properties /nukkit/server.properties

# add the nukkit user, group and workdir
RUN addgroup -S nukkit \
  && adduser -S -G nukkit -h /nukkit nukkit \
  && chown -R nukkit:nukkit /nukkit

USER nukkit

ENV NUKKIT_VERSION 1.0-SNAPSHOT
ENV NUKKIT_DOWNLOAD_URL http://ci.mengcraft.com:8080/job/Nukkit/lastSuccessfulBuild/artifact/target/nukkit-1.0-SNAPSHOT.jar

ENTRYPOINT ["./start.sh"]

RUN wget -q -O Nukkit.jar $NUKKIT_DOWNLOAD_URL

EXPOSE 19132

CMD ["java", "-jar", "Nukkit.jar"]
