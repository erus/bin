#!/bin/sh

# Default interface
if [ -z "$@" ]; then
	IFACE=wlan0 # default interface
else
	case "$1" in
		*)
			IFACE="$1"
		;;
	esac
fi

# Clean output
function local_ip {
	LOCALIP=`ifconfig $IFACE | grep 'inet addr' | cut -d: -f2 | sed s/'  Bcast'//`
}

function public_ip {
	PUBLICIP=`wget -qO - http://www.whatismyip.org/`
}

# Define variables
local_ip
public_ip

# Test output
if [ -z "$LOCALIP" ]; then
	echo "$IFACE has no IP."
else
	echo "$LOCALIP (local)"
fi

if [ -z "$PUBLICIP" ]; then
	echo "Public IP cannot be retrieved."
else
	echo "$PUBLICIP (public)"
fi
