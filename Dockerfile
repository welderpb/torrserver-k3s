FROM alpine/curl

ARG VERSION=MatriX.134
ARG ARCH=linux-amd64

RUN curl -sSL https://github.com/YouROK/TorrServer/releases/download/$VERSION/TorrServer-$ARCH --output /usr/bin/torrserver
RUN chmod +x /usr/bin/torrserver
COPY ./docker-entrypoint.sh /docker-entrypoint.sh

RUN apk add --no-cache --update ffmpeg
EXPOSE 8090/tcp

CMD /docker-entrypoint.sh
