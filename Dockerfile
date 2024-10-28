FROM alpine

RUN apk update && \
    apk upgrade && \
    apk add git rsync && \
    ls && \
    chmod +x entrypoint.sh

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]

USER runner
