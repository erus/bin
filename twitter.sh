#!/bin/sh

# Variables
ACCOUNT=addikt1ve
TWEET="$*"

curl -s -u $ACCOUNT -d status="$TWEET" https://twitter.com/statuses/update.xml -k
