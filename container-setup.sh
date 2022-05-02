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
        mkdir docker_conf && mkdir docker_conf/portainer
        echo "version: '3.7'" >>docker_conf/portainer/compose.yml
        echo "services:" >>docker_conf/portainer/compose.yml
        echo "  app:" >>docker_conf/portainer/compose.yml
        echo "    image: portainer/portainer" >>docker_conf/portainer/compose.yml
        echo "    container_name: portainer" >>docker_conf/portainer/compose.yml
        echo "    restart: unless-stopped" >>docker_conf/portainer/compose.yml
        echo "    command: -H unix:///var/run/docker.sock" >>docker_conf/portainer/compose.yml
        echo "    ports:" >>docker_conf/portainer/compose.yml
        echo "      - 9000:9000" >>docker_conf/portainer/compose.yml
        echo "    volumes:" >>docker_conf/portainer/compose.yml
        echo "      - /etc/localtime:/etc/localtime:ro" >>docker_conf/portainer/compose.yml
        echo "      - /etc/timezone:/etc/timezone:ro" >>docker_conf/portainer/compose.yml
        echo "      - /var/run/docker.sock:/var/run/docker.sock:ro" >>docker_conf/portainer/compose.yml
        echo "      - dataportainer:/data" >>docker_conf/portainer/compose.yml 
        echo "    environment:" >>docker_conf/portainer/compose.yml
        echo '      TZ: "Europe/Paris"' >>docker_conf/portainer/compose.yml
        echo "volumes:" >>docker_conf/portainer/compose.yml
        echo "  dataportainer:" >>docker_conf/portainer/compose.yml
        docker-compose -f docker_conf/portainer/compose.yml up -d
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
