FROM alpine

ADD entrypoint.sh /entrypoint.sh

RUN apk update && \
    apk upgrade && \
    apk add git rsync && \
    chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
