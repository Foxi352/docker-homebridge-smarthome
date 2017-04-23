##
## SmartHomeNG.py
##

## Use latest python 3.5 Alpine based images as starting point
FROM python:2-alpine

## Images labels
LABEL   description = "Homebridge with SmartHomeNG plugin"
        maintainer = "Serge Wagener serge@wagener.family"

## Install SmartHomeNG and needed dependencies
RUN apk add --no-cache --virtual .build-dependencies make g++ \
    && apk add --no-cache nodejs avahi avahi-compat-libdns_sd avahi-dev \
    && npm install -g homebridge homebridge-smarthomeng --unsafe-perm \
    && addgroup -S homebridge \
    && adduser -D -S -h /home/homebridge -s /sbin/nologin -G homebridge homebridge \
    && mkdir /home/homebridge/.homebridge \
    && chown homebridge:homebridge /home/homebridge/.homebridge
    && apk del .build-dependencies

COPY config.json /home/homebridge

EXPOSE 5353 51826

## User modifiable files
VOLUME /home/homebridge/.homebridge

ENTRYPOINT ["/entrypoint.sh"]
