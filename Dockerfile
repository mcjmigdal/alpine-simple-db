FROM alpine:3.16

ARG BUILD_DATE

LABEL maintainer="migdal <mmigdal@iimcb.gov.pl>" \
    org.opencontainers.image.title="alpine-simple-db" \
    org.opencontainers.image.description="MariaDB Docker image running on Alpine Linux with data included" \
    org.opencontainers.image.created=$BUILD_DATE

RUN apk add --no-cache mariadb mariadb-client mariadb-server-utils && \
    rm -f /var/cache/apk/*

ADD ./scripts/ /scripts/
RUN mkdir /docker-entrypoint-initdb.d && \
    mkdir /scripts/pre-exec.d && \
    mkdir /scripts/pre-init.d && \
    chmod -R 755 /scripts

ADD ./docker-entrypoint-initdb.d/ /docker-entrypoint-initdb.d/

EXPOSE 3306

VOLUME ["/var/lib/mysql"]

ENTRYPOINT ["/scripts/run.sh"]
