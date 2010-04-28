#!/bin/sh

if [ -e $HOME/.weechat/weechat_fifo_* ]; then
	screen -x irc
else
	screen -e ^Pp -dmS irc weechat-curses
	screen -x irc
fi
