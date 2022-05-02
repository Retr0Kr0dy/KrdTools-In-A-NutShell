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
" | CONTAINER" "checking this has no effect              ." OFF \
"portainer" " Install portainer and setting it up     ." ON 2>choice

choice=$(cat ./choice)


x=1
while [ $x -le 5 ] ; do
   
    #CONTAINER

    if [[ $choice =~ "portainer" ]]; then
        printf "${BLUE}  | portainer${NC}"
        sleep 1
        echo
        docker pull portainer/portainer
        mkdir docker_cont && cd docker_cont
        mkdir portainer && cd portainer
        echo "version: '3.7'\nservices:\n  portainer:\n    image: portainer/portainer\n    restart: unless-stopped\n    command: -H unix:///var/run/docker.sock\n    ports:\n      - 9000:9000\n    volumes:\n      - /etc/localtime:/etc/localtime:ro\n      - /etc/timezone:/etc/timezone:ro\n      - /var/run/docker.sock:/var/run/docker.sock:ro\n      - dataportainer:/data\n    environment:\n      TZ: "Europe/Paris"\nvolumes:\n  dataportainer:" >compose.yml
        docker-compose up -d
        choice=$(echo $choice | sed 's/\<portainer\>//g')
        

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
