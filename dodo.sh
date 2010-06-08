#!/bin/sh

if [ -z "$@" ]; then
	timez=15
else
	timez=$1
fi

echo "dodo ETA $timez minutes"
su -c "sleep $(($timez*60)) && halt"
