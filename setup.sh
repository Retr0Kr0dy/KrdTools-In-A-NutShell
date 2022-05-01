#!/bin/bash

#COLOR CONSOL

BLUE='\033[0;34m'
YELOW='\033[1;33m'
RED='\033[0;34m'
PURPLE='\033[0;35m'
L_PURPLE='\033[1;35m'
GREEN='\033[0;32m'
L_GREEN='\033[1;32m'
NC='\033[0m'


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
   
    #DEPS

    if [[ $choice =~ "python3" ]]; then
        printf "${BLUE}  | python3${NC}"
        sleep 1
        echo
        apt install python3 -y
        choice=$(echo $choice | sed 's/\<python3\>//g')

    elif [[ $choice =~ "pip" ]]; then
        printf "${BLUE}  | pip${NC}"
        sleep 1
        echo
        apt install pip -y
        choice=$(echo $choice | sed 's/\<pip\>//g')

    elif [[ $choice =~ "netdiscover" ]]; then
        printf "${BLUE}  | netdiscover${NC}"
        sleep 1
        echo
        apt install netdiscover -y
        choice=$(echo $choice | sed 's/\<netdiscover\>//g')

    elif [[ $choice =~ "vs-code" ]]; then
        printf "${BLUE}  | vs-code${NC}"
        sleep 1
        echo
        curl https://az764295.vo.msecnd.net/stable/dfd34e8260c270da74b5c2d86d61aee4b6d56977/code_1.66.2-1649664567_amd64.deb >> vscode.deb
        apt install ./vscode.deb -y
        choice=$(echo $choice | sed 's/\<vs-code\>//g')

    elif [[ $choice =~ "vagrant" ]]; then
        printf "${BLUE}  | vagrant${NC}"
        sleep 1
        echo
        apt install vagrant -y
        choice=$(echo $choice | sed 's/\<vagrant\>//g')

    elif [[ $choice =~ "docker" ]]; then
        printf "${BLUE}  | docker${NC}"
        sleep 1
        echo
        apt install docker -y
        choice=$(echo $choice | sed 's/\<docker\>//g')
    
    #ALIAS
    
    elif [[ $choice =~ "Alias" ]]; then
        echo
        printf "${GREEN}adding ALIAS "
        echo
        sleep 1
        alias ls='ls --color=auto'
        printf "${L_GREEN}ls = ls --color=auto"
        echo
        alias ip='ip --color=auto'
        printf "${L_GREEN}ip= ip --color=auto"
        echo
        alias grep='grep --color=auto'
        printf "${L_GREEN}grep = grep --color=auto"
        echo
        alias diff='diff --color=auto'
        printf "${L_GREEN}diff = diff --color=auto"
        echo
        alias lla='ls -la'
        printf "${L_GREEN}lla = ls -la${NC}"
        choice=$(echo $choice | sed 's/\<Alias\>//g')

    #TOOLS

    elif [[ $choice =~ "Tools" ]]; then
        echo 
        echo 
        printf "${L_GREEN}adding TOOLS" 
        sleep 1
        echo 
        echo
        printf "${GREEN}  | Using /bin/..."
        sleep 1
        echo 
        echo
        printf "${L_GREEN}Red Wifi"
        echo
        echo
        sleep 1
        printf "${GREEN}  | Adding WiFuck ...${L_PURPLE}"
        sleep 1
        echo
        echo
        chmod u+x tools/setup-wifuck.sh
        ./tools/setup-wifuck.sh
        printf "${GREEN}  | Adding WiFuck-rpi ...${L_PURPLE}"
        sleep 1
        echo
        chmod u+x tools/setup-wifuck-rpi.sh
        ./tools/setup-wifuck-rpi.sh
        echo
        printf "${L_GREEN}  Blue tools"
        echo
        sleep 1
        printf "${GREEN}  | Adding CryptSIS-rebirth ...${L_PURPLE}"
        sleep 1
        echo
        chmod u+x tools/setup-cryptsis-rebirth.sh
        ./tools/setup-cryptsis-rebirth.sh
        choice=$(echo $choice | sed 's/\<Tools\>//g')

    else
        x=$(( $x + 10 ))
        echo
        printf "${RED}  COMPLETED !!!"
        echo
        printf "${RED}  COMPLETED !!!"
        echo
        printf "${RED}  COMPLETED !!!"

    fi
done
