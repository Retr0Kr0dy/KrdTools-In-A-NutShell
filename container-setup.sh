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
echo "Container In A Nutshell"
echo
sleep 1


whiptail --title "KrdTools-In-A-NutShell" --checklist \
"Select instalation options" 20 78 9 \
" | CONTAINER" "checking this has no effect " OFF \
"portainer" " WebUI for container management " ON \
"minecraft-server" " Minecraft-server " ON \
"emulatorjs" " Web retro gaming station " ON 2>choice

choice=$(cat ./choice)

x=1

while [ $x -le 5 ] ; do
   
    #CONTAINER

    if [[ $choice =~ "portainer" ]]; then
        printf "${BLUE}  | portainer${NC}"
        sleep 1
        echo
        docker pull portainer/portainer
        docker-compose -f docker_conf/portainer/compose.yml up -d
        choice=$(echo $choice | sed 's/\<portainer\>//g')


    elif [[ $choice =~ "minecraft-server" ]]; then
        printf "${BLUE}  | minecraft-server${NC}"
        sleep 1
        echo
        docker pull itzg/minecraft-server
        docker-compose -f docker_conf/minecraft-server/compose.yml up -d
        choice=$(echo $choice | sed 's/\<minecraft-server\>//g')

    elif [[ $choice =~ "emulatorjs" ]]; then
        printf "${BLUE}  | emulatorjs${NC}"
        sleep 1
        echo
        docker pull lscr.io/linuxserver/emulatorjs:latest
        docker-compose -f docker_conf/emulatorjs/compose.yml up -d
        choice=$(echo $choice | sed 's/\<emulatorjs\>//g')

    else
        x=$(( $x + 10 ))
        echo
        printf "${PURPLE}  COMPLETED !!!"
        echo
        printf "${L_PURPLE}  COMPLETED !!!"
        echo
        printf "${RED}  COMPLETED !!!"

    fi
done

rm -rf choice 
