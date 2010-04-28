#!/bin/sh

# Choose interface
IFACE=eth0

# Find IP address
LOCALIP=`ifconfig $IFACE | grep 'inet addr' | cut -d: -f2 | sed s/'  Bcast'//`

# Find network
LOCALNETWORK=`ifconfig eth0 | grep 'Bcast' | cut -d: -f 3 | sed s/'  Mask'// | sed s/255/0/ `

# Scan network

nmap -sP $LOCALNETWORK/24 | grep "Nmap scan report for" | sed s/'Nmap scan report for '//g
