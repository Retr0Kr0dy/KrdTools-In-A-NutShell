#!/bin/bash

clear
echo "Kali In A Nutshell"

#ALIAS

echo
echo " adding ALIAS "
echo
alias ls='ls --color=auto'
alias ip='ip --color=auto'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias lla='ls -la'

#DEPS

echo
echo " adding DEPS "
echo
apt install python3 python3-pip netdiscover -y

#TOOLS

echo
echo " adding TOOLS" 
echo
echo "  | Using /bin/..."
echo
echo "  Red Wifi"
echo
echo "  | Adding WiFuck ..."
echo
chmod u+x setup-wifuck.sh
./setup-wifuck.sh
echo
echo "  | Adding WiFuck-rpi ..."
echo
chmod u+x setup-wifuck-rpi.sh
./setup-wifuck-rpi.sh
echo
echo "  | Adding CryptSIS-rebirth ..."
echo
chmod u+x setup-cryptsis-rebirth.sh
./setup-cryptsis-rebirth.sh
