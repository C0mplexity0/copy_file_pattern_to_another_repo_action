FROM alpine

ADD entrypoint.sh /entrypoint.sh

RUN apk update && \
    apk upgrade && \
    apk add git rsync && \
    apk add --no-cache bash && \
    chmod +x /entrypoint.sh && \
    set -x

ENTRYPOINT [ "bash", "/entrypoint.sh" ]
