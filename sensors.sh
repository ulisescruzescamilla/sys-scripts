#!/bin/bash
# This script needs lm-sensor installed
export HOME=
export DISPLAY=:0.0
CURRENT_TEMP_CPU=$(sensors | grep -i Package | awk {'print $4'} | sed 's/.//;s/..°C$//')
LIMIT=80
LOG_FILE_NAME=temperature.log
TIMESTAMP=`date "+%Y-%m-%d %H:%M:%S"`

# Save in log
echo "[$TIMESTAMP] - CPU TEMPERATURE = $CURRENT_TEMP_CPU °C" >> $LOG_FILE_NAME
# show notification
if [ "$CURRENT_TEMP_CPU" -ge "$LIMIT" ] ; then
    /usr/bin/notify-send -i dialog-warning -u critical -t 2000 "Rebase temperature: ${CURRENT_TEMP_CPU}°C , LIMIT IS ${LIMIT}°C"
fi