#!/bin/sh

# upload.sh
# AddiKT1ve <the.addikt1ve@gmail.com>

# Check arguments and display error
if [ -z "$@" -o "$#" -gt 1 ]; then
	echo "Usage: $0 file"
	exit 1
fi

# Functions
get_rand() {
	dd if=/dev/urandom count=64 bs=1 2>/dev/null | md5sum | cut -c1-6
}

# Variables
SSHHOST=rootards.org
SSHUSER=addikt1ve
SSHPATH=$HOME/public_html/files
SSHNAME=`get_rand`.`basename "$1" | tr ' ' '_'`
DISTURL=http://rootards.org/~addikt1ve/files/$SSHNAME

# Upload file
scp "$1" $SSHUSER@$SSHHOST:$SSHPATH/$SSHNAME
echo $DISTURL | xclip
