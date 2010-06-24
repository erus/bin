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

# koin.me uploader
# send me your SSH public key to get a free access :-)
koinup() {
	user=$USER
	rdir="~/htdocs/$user/$TODAYDIR"
	file=`basename $1`
	cat $1 | ssh koin@koin.me "mkdir -p $rdir ; cat >> $rdir/$file"
	echo "http://koin.me/$user/$TODAYDIR/$file"
}

# Variables
SHOTSDIR=$HOME/shots
TODAYDIR=`date +%Y-%m-%d`
SHOTNAME=koin-`date +%H-%M-%S`.png
# full path
SHOTPATH="$SHOTSDIR/$TODAYDIR/$SHOTNAME"
# remove following variable if you don't want to upload your shots
#UPLOADER=ompload
UPLOADER=koinup

# Directory test
[ -d $SHOTSDIR/$TODAYDIR ] || mkdir -p $SHOTSDIR/$TODAYDIR

# Cheese!
if [ "$DISPLAY" != "" ]; then
	scrot $SHOTPATH
else
	fbgrab $SHOTPATH
fi

# Lighten the png file
where advpng &> /dev/null
if [ $? -eq 0 ] ; then
	advpng -z4 $SHOTPATH
fi

# Upload
if [ -n "$UPLOADER" ]; then
	$UPLOADER $SHOTPATH
fi
