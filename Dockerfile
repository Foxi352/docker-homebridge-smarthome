##
## SmartHomeNG.py
##

## Use latest python 3.5 Alpine based images as starting point
FROM python:2-alpine

## Images labels
LABEL   description = "Homebridge with SmartHomeNG plugin"
        maintainer = "Serge Wagener serge@wagener.family"

## Install SmartHomeNG and needed dependencies
RUN apk add --no-cache virtual .build-dependencies make g++ \
    && apk add --no-cache nodejs avahi avahi-compat-libdns_sd avahi-dev \
    && npm install -g homebridge homebridge-smarthomeng --unsafe-perm \
    && addgroup -S homebridge \
    && adduser -D -S -m -d /home/homebridge -s /sbin/nologin -G homebridge homebridge \
    && apk del .build-dependencies

## WebSocket, Backend
#EXPOSE 2424 8383

## User modifiable files
#VOLUME /var/www/html /usr/local/smarthome/etc /usr/local/smarthome/items /usr/local/smarthome/logics /usr/local/smarthome/scenes

ENTRYPOINT ["/entrypoint.sh"]
