ARG GNOLAND_TAG=test

FROM gnoland:${GNOLAND_TAG}

USER root

RUN apk add --no-cache curl

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
COPY data /data

ENTRYPOINT ["docker-entrypoint.sh"]