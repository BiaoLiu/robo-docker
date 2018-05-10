FROM python:3.6-alpine

RUN apk update && apk add \
        git openssh \
        libuuid \
        pcre \
        mailcap \
        gcc \
        libc-dev \
        linux-headers \
        pcre-dev \
        tzdata \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai  /etc/localtime \
    && pip install --no-cache-dir uWSGI \
    && rm -rf /tmp/*

RUN apk add --no-cache --virtual .build-deps mariadb-dev \
    && pip install mysqlclient \
    && apk add --virtual .runtime-deps mariadb-client-libs \
    && apk del .build-deps \
    && apk del \
        gcc \
        libc-dev \
        linux-headers \
