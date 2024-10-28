FROM alpine

RUN apk update && \
    apk upgrade && \
    apk add git rsync && \
    chmod +x entrypoint.sh

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]

USER runner
