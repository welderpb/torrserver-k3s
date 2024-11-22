FROM alpine/curl

ENV TS_CONF_PATH="/opt/ts/config"
ENV TS_LOG_PATH="/opt/ts/log"
ENV TS_TORR_DIR="/opt/ts/torrents"
ENV TS_PORT=8090
ARG VERSION=134
ARG ARCH=linux-amd64

RUN curl -sSL https://github.com/YouROK/TorrServer/releases/download/MatriX.$VERSION/TorrServer-$ARCH --output /usr/bin/torrserver
COPY ./docker-entrypoint.sh /docker-entrypoint.sh

RUN apk add --no-cache --update ffmpeg
EXPOSE $TS_PORT/tcp

CMD /docker-entrypoint.sh
