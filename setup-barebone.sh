#!/bin/bash

clear
echo "Kali In A Nutshell"
sleep 1

#ALIAS

echo
echo " adding ALIAS "
sleep 1
echo
alias ls='ls --color=auto'
alias ip='ip --color=auto'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias lla='ls -la'

#DEPS

echo
echo " adding DEPS "
sleep 1
echo
echo
echo "  | python3"
sleep 1
echo
apt install python3 -y
echo
echo "  | python3-pip"
sleep 1
echo
apt install python3-pip -y
echo
echo "  | netdiscover"
sleep 1
echo
apt install netdiscover -y
echo
echo "  | vs-code"
sleep 1
echo
curl https://az764295.vo.msecnd.net/stable/dfd34e8260c270da74b5c2d86d61aee4b6d56977/code_1.66.2-1649664567_amd64.deb >> vscode.deb
apt install ./vscode.deb -y
echo
echo "  | vagrant"
sleep 1
echo
apt install vagrant -y
echo
echo
echo "  | docker"
sleep 1
echo
apt install docker -y
echo

#TOOLS

echo
echo " adding TOOLS" 
sleep 1
echo
echo "  | Using /bin/..."
sleep 1
echo
echo "  Red Wifi"
sleep 1
echo
echo "  | Adding WiFuck ..."
sleep 1
echo
chmod u+x tools/setup-wifuck.sh
./tools/setup-wifuck.sh
echo
echo "  | Adding WiFuck-rpi ..."
sleep 1
echo
chmod u+x tools/setup-wifuck-rpi.sh
./tools/setup-wifuck-rpi.sh
echo
echo "  | Adding CryptSIS-rebirth ..."
sleep 1
echo
chmod u+x tools/setup-cryptsis-rebirth.sh
./tools/setup-cryptsis-rebirth.sh
