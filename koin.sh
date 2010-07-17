#!/bin/sh

# koin.sh
# AddiKT1ve <the.addikt1ve@gmail.com>

# Output duck
echo ' __              __    KOIN'
echo ' \ \       ___  / /      KOIN'
echo '  \ \     / _ \/ /   KOIN   KOIN'
echo '   \ \   | (0) \ \       KOIN'
echo '    \_\___\___/ \_\    KOIN'
echo '     |_____|'

. $XDG_CONFIG_DIRS/koin/koin.conf
[ -e $XDG_CONFIG_HOME/koin/koin.conf ] && . $XDG_CONFIG_HOME/koin/koin.conf

# koin.me uploader
# send me your SSH public key to get a free access :-)
koinup() {
        user=$USER
        rdir="~/htdocs/$user/$TODAYDIR"
        file=`basename $1`
        cat $1 | ssh koin@koin.me "mkdir -p $rdir ; cat >> $rdir/$file"
        echo "http://koin.me/$user/$TODAYDIR/$file"
}


# Directory test
[ -d $SHOTSDIR/$TODAYDIR ] || mkdir -p $SHOTSDIR/$TODAYDIR

# Cheese!
if [ -n "$DISPLAY" ]; then
	which scrot > /dev/null 2>&1
	if [ $? -eq 0 ] ; then
	scrot $SHOTPATH
	else
		which import > /dev/null 2>&1
		if [ $? -eq 0 ] ; then
		import -window root $SHOTPATH
		else
		echo "You should have either scrot or import (form ImageMagick) installed" >&2
		exit 1
		fi
	fi
else
	which fbgrab > /dev/null 2>&1
	if [ $? -eq 0 ] ; then
	fbgrab $SHOTPATH
	else
		which fbshot > /dev/null 2>&1
		if [ $? -eq 0 ] ; then
		fbshot $SHOTPATH
		else
		echo "You should have either fbgrab or fbshot installed" >&2
		exit 1
		fi
	fi
fi

# Enlight the png file
which advpng > /dev/null 2>&1
if [ $? -eq 0 ] ; then
	advpng -q -z4 $SHOTPATH
fi

# Upload
if [ -n "$UPLOADER" ]; then
	which xclip > /dev/null 2>&1
	if [ $? -eq 0 ] ; then
	$UPLOADER $SHOTPATH 1>&2 | xclip
	else
	$UPLOADER $SHOTPATH
	fi
fi
