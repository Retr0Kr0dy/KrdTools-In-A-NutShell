#!/bin/bash

clear
echo "Kali In A Nutshell"
echo
sleep 1

whiptail --title "KrdTools-In-A-NutShell" --checklist \
"Select instalation options" 20 78 9 \
" | DEPS" "checking this has no effect              ." OFF \
"python3" "Install python3                          ." ON \
"pip" "Install python3-pip                      ." ON \
"netdiscover" "Install netdiscover                      ." ON \
"vs-code" "Install Visual Studio Code               ." OFF \
"vagrant" "Install vagrant                          ." OFF \
"docker" "Install docker                           ." OFF \
"Alias" "Add basic alias                          ." ON \
"Tools" "Add basic tools                          ." ON 2>choice

choice=$(cat ./choice)


x=1
while [ $x -le 5 ] ; do
    echo $choice
    echo $i
    
    #DEPS

    if [[ $choice =~ "python3" ]]; then
        echo "  | python3"
        sleep 1
        echo
        apt install python3 -y
        choice=$(echo $choice | sed 's/\<python3\>//g')

    elif [[ $choice =~ "pip" ]]; then
        echo "  | pip"
        sleep 1
        echo
        apt install pip -y
        choice=$(echo $choice | sed 's/\<python-pip\>//g')

    elif [[ $choice =~ "netdiscover" ]]; then
        echo "  | netdiscover"
        sleep 1
        echo
        apt install netdiscover -y
        choice=$(echo $choice | sed 's/\<netdiscover\>//g')

    elif [[ $choice =~ "vs-code" ]]; then
        echo "  | vs-code"
        sleep 1
        echo
        curl https://az764295.vo.msecnd.net/stable/dfd34e8260c270da74b5c2d86d61aee4b6d56977/code_1.66.2-1649664567_amd64.deb >> vscode.deb
        apt install ./vscode.deb -y
        choice=$(echo $choice | sed 's/\<vs-code\>//g')

    elif [[ $choice =~ "vagrant" ]]; then
        echo "  | vagrant"
        sleep 1
        echo
        apt install vagrant -y
        choice=$(echo $choice | sed 's/\<vagrant\>//g')

    elif [[ $choice =~ "docker" ]]; then
        echo "  | docker"
        sleep 1
        echo
        apt install docker -y
        choice=$(echo $choice | sed 's/\<docker\>//g')
    
    #ALIAS
    
    elif [[ $choice =~ "Alias" ]]; then
        echo
        echo "adding ALIAS "
        echo
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

    else
        x=$(( $x + 10 ))
        echo
        echo "  COMPLETED !!!"

    fi
done
