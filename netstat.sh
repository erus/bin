#!/bin/sh

# netstat.sh
# AddiKT1ve <the.addikt1ve@gmail.com>
# Mwyann <http://mwyann.info>

# Variables
ETHIFACE=eth0
WLANIFACE=wlan0
TMPDIR=$HOME/tmp

# Functions
function rx_bytes { # download
	RXETHERNET=`cat /sys/class/net/$ETHIFACE/statistics/rx_bytes`
	RXWIRELESS=`cat /sys/class/net/$WLANIFACE/statistics/rx_bytes`
	echo $(($RXETHERNET+$RXWIRELESS))
}

function tx_bytes { # upload
	TXETHERNET=`cat /sys/class/net/$ETHIFACE/statistics/tx_bytes`
	TXWIRELESS=`cat /sys/class/net/$WLANIFACE/statistics/tx_bytes`
	echo $(($TXETHERNET+$TXWIRELESS))
}

# Download
LASTRXBYTES=`cat $TMPDIR/last_rxbytes`
# Upload
LASTTXBYTES=`cat $TMPDIR/last_txbytes`

# Download
RXBYTES=`rx_bytes`
RXRESULT=$((($RXBYTES-LASTRXBYTES)/1000))
echo $RXBYTES > $TMPDIR/last_rxbytes
# Upload
TXBYTES=`tx_bytes`
TXRESULT=$((($TXBYTES-LASTTXBYTES)/1000))
echo $TXBYTES > $TMPDIR/last_txbytes

echo "↓ $RXRESULT Ko/s | $TXRESULT Ko/s ↑"
