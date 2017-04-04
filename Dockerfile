FROM alpine:3.5

LABEL maintainer mconcas@cern.ch

RUN apk add --update py-pip curl unzip                               && \
    curl -LOk https://github.com/mconcas/plancton/archive/master.zip && \
    unzip master.zip                                                 && \
    cd plancton-master                                               && \
    pip install -e .                                                 && \
    apk del unzip                                                    && \
    rm -f master.zip                                                 && \
    rm -Rf /var/cache/apk/*

COPY entrypoint.sh /tmp/entrypoint.sh

ENTRYPOINT [ "/tmp/entrypoint.sh" ]
