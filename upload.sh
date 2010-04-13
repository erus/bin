#!/bin/sh
# deps: scp xclip

DISTUSER=addikt1ve
DISTHOST=rootards.org
DISTPATH=/home/addikt1ve/public_html/files/
DISTLINK=http://$DISTHOST/~$DISTUSER/files/$1
LOCALFILE=`basename $1`

if [ -z "$1" ]; then
	echo "FAIL!"
else
	scp -r $LOCALFILE $DISTUSER@$DISTHOST:$DISTPATH
	echo $DISTLINK | xclip
fi
