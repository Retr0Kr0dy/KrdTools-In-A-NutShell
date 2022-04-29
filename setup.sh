#!/bin/bash

clear
echo "Kali In A Nutshell"
echo
echo "  | Creating /home/Krdtools directory ..."
echo
mkdir /home/KrdTools
echo
echo "  | Adding /home/Krdtools directory to PATH ..."
echo
export PATH=$PATH:/home/KrdTools
echo
echo "  Red Wifi"
echo
echo "  | Adding WiFuck ..."
echo
chmod u+x setup-wifuck.sh
sudo ./setup-wifuck.sh
echo
echo "  | Adding WiFuck-rpi ..."
echo
chmod u+x setup-wifuck-rpi.sh
sudo ./setup-wifuck-rpi.sh
