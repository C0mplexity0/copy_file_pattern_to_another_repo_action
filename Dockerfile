FROM alpine

RUN apk update && \
    apk upgrade && \
    apk add git rsync && \
    sudo usermod -a -G docker runner
    

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]

USER runner
