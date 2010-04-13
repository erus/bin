#!/bin/sh

# wlppr.sh
# AddiKT1ve <the.addikt1ve@gmail.com>

# Check arguments
if [ -z "$@" ]; then
	echo "Usage: $0 [--scale | --center] file"
	exit 1
fi

# To switch or not to switch...
if [ "$1" = "--scale" -o "$1" = "--center" ]; then
	# Check switches
	case "$1" in
		--center)
			FEHTYPE="center"
		;;
		--scale)
			FEHTYPE="scale"
		;;
	esac
	WALLPATH="$2"
else
	FEHTYPE="scale" # default value
	WALLPATH="$1"
fi

# Variables
WALLNAME=`echo $WALLPATH | awk -F"/" '{print $NF}'`
WALLDIR="$HOME/Images/Wallpapers"
FEHSCRIPT="$HOME/.fehbg"

# Local or remote file?
if [ "`echo $WALLPATH | sed s_//_%_ | cut -d% -f1`" = "http:" ]; then
	wget -P $WALLDIR $WALLPATH # download remote file
else
	mv $WALLPATH $WALLDIR # move it to default $WALLDIR
fi

# Check errors
feh --bg-$FEHTYPE "$WALLDIR/$WALLNAME" || . $FEHSCRIPT && exit 1

# No error? Hold on!
# Write wallpaper path into the script
echo "feh --bg-$FEHTYPE '$WALLDIR/$WALLNAME'" > $FEHSCRIPT

# Execute the script (even if it's not executable)
. $FEHSCRIPT
