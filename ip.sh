#!/bin/sh

# Which interface
case "$1" in
	*)
		IFACE="$1"
	;;
esac

# Default interface
if [ -z "$@" ]; then
	IFACE=wlan0 # default interface
fi

# Clean output
function ip_output {
	ifconfig $IFACE | grep 'inet addr' | cut -d: -f2 | sed s/'  Bcast'//
}

if [ -z "`ip_output`" ]; then
	echo "$IFACE has no IP."
else
	ip_output
fi
