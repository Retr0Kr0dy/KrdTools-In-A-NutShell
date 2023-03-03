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
echo
echo "any debian shit In A Nutshell"
echo
sleep 1

whiptail --title "KrdTools-In-A-NutShell" --checklist \
"Select instalation options" 20 78 13 \
" ¬ohmyzsh" "Install and configure oh-my-zsh         ." ON \
" | DEPS" "checking this has no effect              ." ON \
" ¬python3" "Install python3                          ." ON \
" ¬pip" "Install python3-pip                      ." ON \
" ¬netdiscover" "Install netdiscover                      ." ON \
" ¬vs-code" "Install Visual Studio Code               ." OFF \
" ¬vagrant" "Install vagrant                          ." OFF \
" ¬docker" "Install docker                           ." OFF \
" ¬compose" "Install docker-compose                   ." OFF \
" | DRIVER" "checking this has no effect              ." ON \
" ¬rtl8812au" "Install RTL8812AU driver for Alfa        ." OFF \
"Alias" "Add basic alias                          ." ON \
"Tools" "Add basic tools                          ." ON 2>choice

choice=$(cat ./choice)


x=1
while [ $x -le 5 ] ; do

    if [[ $choice =~ "ohmyzsh" ]]; then
        printf "${BLUE}  | ohmyzsh${NC}"
        sleep 1
        echo
        sudo apt install zsh -y
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
        source ~/.oh-my-zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
        source ~/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
        cp ./config/zsh.config ~/.zshrc
        choice=$(echo $choice | sed 's/\<ohmyzsh\>//g')

    #DEPS

    elif [[ $choice =~ "python3" ]]; then
        printf "${BLUE}  | python3${NC}"
        sleep 1
        echo
        sudo apt install python3 -y
        choice=$(echo $choice | sed 's/\<python3\>//g')

    elif [[ $choice =~ "pip" ]]; then
        printf "${BLUE}  | pip${NC}"
        sleep 1
        echo
        sudo apt install pip -y
        choice=$(echo $choice | sed 's/\<pip\>//g')

    elif [[ $choice =~ "netdiscover" ]]; then
        printf "${BLUE}  | netdiscover${NC}"
        sleep 1
        echo
        sudo apt install netdiscover -y
        choice=$(echo $choice | sed 's/\<netdiscover\>//g')

    elif [[ $choice =~ "vs-code" ]]; then
        printf "${BLUE}  | vs-code${NC}"
        sleep 1
        echo
        curl https://az764295.vo.msecnd.net/stable/dfd34e8260c270da74b5c2d86d61aee4b6d56977/code_1.66.2-1649664567_amd64.deb >> vscode.deb
        sudo apt install ./vscode.deb -y
        choice=$(echo $choice | sed 's/\<vs-code\>//g')

    elif [[ $choice =~ "vagrant" ]]; then
        printf "${BLUE}  | vagrant${NC}"
        sleep 1
        echo
        sudo apt install vagrant -y
        choice=$(echo $choice | sed 's/\<vagrant\>//g')

    elif [[ $choice =~ "docker" ]]; then
        printf "${BLUE}  | docker${NC}"
        sleep 1
        echo
        sudo apt install docker.io -y
        sudo setfacl --modify user:1000:rw /var/run/docker.sock
        choice=$(echo $choice | sed 's/\<docker\>//g')
    
    elif [[ $choice =~ "compose" ]]; then
        printf "${BLUE}  | docker-compose${NC}"
        sleep 1
        echo
        sudo apt install docker-compose -y
        choice=$(echo $choice | sed 's/\<compose\>//g')
        
    #ALIAS
    
    elif [[ $choice =~ "Alias" ]]; then
        echo
        printf "${GREEN}adding ALIAS "
        echo
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
        printf "${GREEN}adding TOOLS" 
        sleep 1
        echo 
        echo
        printf "${L_GREEN}  | Using /bin/..."
        sleep 1
        echo 
        echo
        printf "${GREEN}Red Wifi"
        echo
        echo
        sleep 1
        printf "${L_GREEN}  | Adding WiFuck ...${L_PURPLE}"
        sleep 1
        echo
        echo
        sudo ./tools/setup-wifuck.sh
        printf "${L_GREEN}  | Adding WiFuck-rpi ...${L_PURPLE}"
        sleep 1
        echo
        sudo ./tools/setup-wifuck-rpi.sh
        echo
        printf "${GREEN}Blue tools"
        echo
        echo
        sleep 1
        printf "${L_GREEN}  | Adding CryptSIS-rebirth ...${L_PURPLE}"
        sleep 1
        echo
        sudo ./tools/setup-cryptsis-rebirth.sh
        choice=$(echo $choice | sed 's/\<Tools\>//g')

    # DRIVER

    elif [[ $choice =~ "rtl8812au" ]]; then
        printf "${BLUE}  | rtl8812au${NC}"
        sleep 1
        echo
        apt install dkms git -y
        git clone https://github.com/aircrack-ng/rtl8812au
        cd rtl8812au && make && make install
        choice=$(echo $choice | sed 's/\<rtl8812au\>//g')
        

    else
        x=$(( $x + 10 ))
        echo
        printf "${PURPLE}  COMPLETED !!!"
        echo
        printf "${L_PURPLE}  COMPLETED !!!"
        echo
        printf "${RED}  COMPLETED !!!"
        echo
    fi
done

rm -rf choice 
