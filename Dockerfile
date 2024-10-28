FROM alpine

RUN apk update && \
    apk upgrade && \
    apk add git rsync && \
    ls && \
    chmod +x /home/runner/work/copy_file_pattern_to_another_repo_action/copy_file_pattern_to_another_repo_action/entrypoint.sh

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]

USER runner
