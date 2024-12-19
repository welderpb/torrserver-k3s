FROM alpine/curl

ENV TS_PATH="/opt/ts/config"
ENV TS_LOGPATHDIR="/opt/ts/log"
ENV TS_PORT=8090
ARG VERSION=MatriX.134
ARG ARCH=linux-amd64

RUN curl -sSL https://github.com/YouROK/TorrServer/releases/download/$VERSION/TorrServer-$ARCH --output /usr/bin/torrserver
COPY ./docker-entrypoint.sh /docker-entrypoint.sh

RUN apk add --no-cache --update ffmpeg
EXPOSE $TS_PORT/tcp

CMD /docker-entrypoint.sh
