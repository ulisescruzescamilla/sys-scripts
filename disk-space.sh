#!/bin/bash
CURRENT=$(df / | grep / | awk '{ print $5}' | sed 's/%//g')
THRESHOLD=90
WARN_MAX=50

notify-send -t 8000 "Disk space: ${CURRENT}%" 

if [ "$CURRENT" -ge "$THRESHOLD" ] ; then
    mail -s 'Disk Space Alert' email@localhost << EOF
Your root partition remaining free space is critically low. Used: $CURRENT%
EOF

fi
