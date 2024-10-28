FROM alpine

ADD entrypoint.sh /entrypoint.sh
ADD copy.sh /copy.sh

RUN apk update && \
    apk upgrade && \
    apk add git rsync && \
    chmod +x /entrypoint.sh && \
    set -x

ENTRYPOINT [ "/bin/bash", "-c", "/entrypoint.sh" ]
