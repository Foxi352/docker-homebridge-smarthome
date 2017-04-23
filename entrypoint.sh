#!/bin/sh

CONFIG_PATH=/home/homebridge/.homebridge
EXAMPLES_PATH=/home/homebridge

# Check if there is a minimum of config files, if not provide some example to prevent startup errors
if [ ! -e "$CONFIG_PATH/config.json" ]; then
    echo "No config file found, using example file"
    cp $EXAMPLES_PATH/config.json $CONFIG_PATH/;
    chown homebridge:homebridge $CONFIG_PATH/config.json
fi

# Launch our main service
su -s /bin/sh -c homebridge homebridge
