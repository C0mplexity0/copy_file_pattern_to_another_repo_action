FROM alpine

RUN apk update && \
    apk upgrade && \
    apk add git rsync && \
    sudo ./entrypoint.sh stop && \
    sudo ./entrypoint.sh start

