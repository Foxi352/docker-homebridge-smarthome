#!/bin/sh

CONFIG_PATH=/home/homebridge/.homebridge
EXAMPLES_PATH=/home/homebridge

# Check if there is a minimum of config files, if not provide some example to prevent startup errors
if [ ! -e "$CONFIG_PATH/config.json" ]; then 
    cp $EXAMPLES_PATH/config.json $CONFIG_PATH/; 
fi

# Launch our main service, preferably in debug mode as it should stay in foreground
su -s /bin/sh -c homebridge homebridge
$SHNG_PATH/bin/smarthome.py "$ARGS"

