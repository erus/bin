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

# Variables
SHOTSDIR=$HOME/shots
TODAYDIR=`date +%Y-%m-%d`
SHOTNAME=koin-`date +%T`.png

# Directory test
[ -d $SHOTSDIR/$TODAYDIR ] || mkdir -p $SHOTSDIR/$TODAYDIR

# Cheese!
scrot $SHOTSDIR/$TODAYDIR/$SHOTNAME
