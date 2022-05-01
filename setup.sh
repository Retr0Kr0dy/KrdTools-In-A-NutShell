#!/bin/bash

clear
echo "Kali In A Nutshell"
echo
sleep 1

whiptail --title "KrdTools-In-A-NutShell" --checklist \
"Select instalation options" 20 78 9 \
"Alias" "Add basic alias                          ." ON \
"Tools" "Add basic tools                          ." ON \
" | DEPS" "checking this has no effect              ." OFF \
"Python3" "Install python3                          ." ON \
"Python3-pip" "Install python3-pip                      ." ON \
"Netdiscover" "Install netdiscover                      ." ON \
"Vs-code" "Install Visual Studio Code               ." OFF \
"Vagrant" "Install vagrant                          ." OFF \
"Docker" "Install docker                           ." OFF 2>choice

choice=$(cat ./choice)

#ALIAS

x=1
while [ $x -le 5 ] ; do
    echo $choice
    echo $i
    if [[ $choice =~ "Alias" ]]; then
        echo
        echo "adding ALIAS\n "
        sleep 1
        alias ls='ls --color=auto'
        echo "ls = ls --color=auto"
        alias ip='ip --color=auto'
        echo "ip= ip --color=auto"
        alias grep='grep --color=auto'
        echo "grep = grep --color=auto"
        alias diff='diff --color=auto'
        echo "diff = diff --color=auto"
        alias lla='ls -la'
        echo "lla = ls -la"
        choice=$(echo $choice | sed 's/\<Alias\>//g')

    #TOOLS

    elif [[ $choice =~ "Tools" ]]; then
        echo " adding TOOLS" 
        sleep 1
        echo "  | Using /bin/..."
        sleep 1
        echo "  Red Wifi"
        sleep 1
        echo "  | Adding WiFuck ..."
        sleep 1
        echo
        chmod u+x tools/setup-wifuck.sh
        ./tools/setup-wifuck.sh
        echo "  | Adding WiFuck-rpi ..."
        sleep 1
        echo
        chmod u+x tools/setup-wifuck-rpi.sh
        ./tools/setup-wifuck-rpi.sh
        echo "  Blue tools"
        sleep 1
        echo "  | Adding CryptSIS-rebirth ..."
        sleep 1
        echo
        chmod u+x tools/setup-cryptsis-rebirth.sh
        ./tools/setup-cryptsis-rebirth.sh
        choice=$(echo $choice | sed 's/\<Tools\>//g')


    #DEPS

    elif [[ $choice =~ "Python3" ]]; then
        echo "  | python3"
        sleep 1
        echo
        apt install python3 -y
        choice=$(echo $choice | sed 's/\<Python3\>//g')

    elif [[ $choice =~ "Python3-pip" ]]; then
        echo "  | python3-pip"
        sleep 1
        echo
        apt install python3-pip -y
        choice=$(echo $choice | sed 's/\<Python3-pip\>//g')

    elif [[ $choice =~ "Netdiscover" ]]; then
        echo "  | netdiscover"
        sleep 1
        echo
        apt install netdiscover -y
        choice=$(echo $choice | sed 's/\<Netdiscover\>//g')

    elif [[ $choice =~ "Vs-code" ]]; then
        echo "  | vs-code"
        sleep 1
        echo
        curl https://az764295.vo.msecnd.net/stable/dfd34e8260c270da74b5c2d86d61aee4b6d56977/code_1.66.2-1649664567_amd64.deb >> vscode.deb
        apt install ./vscode.deb -y
        choice=$(echo $choice | sed 's/\<Vs-code\>//g')

    elif [[ $choice =~ "Vagrant" ]]; then
        echo "  | vagrant"
        sleep 1
        echo
        apt install vagrant -y
        choice=$(echo $choice | sed 's/\<Vagrant\>//g')

    elif [[ $choice =~ "Docker" ]]; then
        echo "  | docker"
        sleep 1
        echo
        apt install docker -y
        choice=$(echo $choice | sed 's/\<Docker\>//g')

    else
        x=$(( $x + 10 ))
        echo
        echo "  COMPLETED !!!"

    fi
done
