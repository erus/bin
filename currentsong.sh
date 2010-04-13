#!/bin/bash
# AddiKT1ve <the.addikt1ve@gmail.com>

# currentsong.sh displays song played by mpd on the IRC channels you specify.
# Usage: ./currentsong.sh channel1 channel2 channel3
# If no channel is specified, $FAVCHAN will be used.

# Some variables
NETWORK=irc.freenode
FAVCHAN=##hippie
CURRENT="♪ `mpc current`"
FIFOLOOP=$HOME/.weechat/weechat_fifo_`pidof weechat-curses`

# The function which does the output work
function fifo_echo {
	echo -e "$NETWORK.$CHANNEL *$CURRENT" > $FIFOLOOP
}

# Here we go
if [ $# -gt 0 ]
then
	for CHANNEL in $*; do
		fifo_echo
	done
else
	CHANNEL=$FAVCHAN
	fifo_echo
fi
