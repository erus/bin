#!/bin/sh

HOSTNAME=`uname -n`
KERNEL=`uname -srm`
UPTIME=`uptime | cut -d' ' -f2`


echo "$USER@$HOSTNAME running $KERNEL"
echo "up for $UPTIME"
