# KrdTools-In-A-NutShell
Just making stuff for me, don't use it, or, use it, as you want, not my pbrlm

A life Simplifier for Debian based distrib.

# Usage
### Setup.sh 
clone this repo, execute setup.sh (as sudo in most case).
```sh
git clone https://github.com/Retr0Kr0dy/KrdTools-In-A-NutShell
cd KrdTools-In-A-NutShell
./setup.sh # no sudo
```
This script can install usefull packages (such as vscode, docker, etc...), install drivers (like rtl8812au for Alfa antenna), add some beautiful alias (ls --color for non beatufied version of debian) and can install usefull tools (Crypt_SIS for encryption, wifuck for ez wifi deauth,etc...).
[See content](https://github.com/Retr0Kr0dy/KrdTools-In-A-NutShell#content-for-setupsh)
### Container-setup.sh
Normally, for this script, you should already have properly install Docker.io and Docker-compose, both are needed.
```sh
./container-setup.sh
```
This script simplifie usage of docker by pulling image, setting it up, and create container for you.
[See content](https://github.com/Retr0Kr0dy/KrdTools-In-A-NutShell#content-for-container-setupsh)
# Content for Setup.sh
### DEPS
Different usefull packages
| Name | Description |
|-----------|-----------|
| [*ohmyzsh*](https://ohmyz.sh/#install) | *enchanced terminal* |
| [*python3*](https://www.python.org/) | *For script* |
| [*pip*](https://pypi.org/project/pip/) | *For installing python lib* |
| [*vs-code*](https://code.visualstudio.com/) | *Graphical IDE* |
| [*docker*](https://www.docker.com/) | *Container engine* |
| [*compose*](https://docs.docker.com/compose/) | *Docker deployments scripting* |
| [*vagrant*](https://www.vagrantup.com/) | *VM and container manager* |
| [*netdiscover*](https://www.kali.org/tools/netdiscover/#:~:text=Netdiscover%20is%20an%20active%2Fpassive,used%20on%20hub%2Fswitched%20networks.) | *Usefull ARP pinging script* |
### DRIVER
Driver that should be installed
| Name | Description |
|-----------|-----------|
| [*rtl8812au*](https://github.com/aircrack-ng/rtl8812au) | *For Alfa antenna* |
### ALIAS
`ls='ls --color=auto'`

`ip='ip --color=auto'`

`grep='grep --color=auto'`

`diff='diff --color=auto'`

`lla='ls -la'`

and some more in oh-my-zsh config

### Tools
Usefull tools, installed in `/usr/local/bin/`
| Name | Description |
|-----------|-----------|
| [*CryptSIS-Rebirth*](https://github.com/Retr0Kr0dy/CryptSIS-rebirth) | *Encryptions and decryption tool (AES, RSA, Blowfish, XOR)* |
| [*WiFuck*](https://github.com/Retr0Kr0dy/wifuck) | *WiFI bullshiting tool* |
| [*WiFuck-rpi*](https://github.com/Retr0Kr0dy/wifuck) | *Same but for Raspberry pi* |
# Content for container-setup.sh
### Container
| Name | Description | Usefull ports |
|-----------|--------------------------------------|------------|
| [*portainer*](https://www.portainer.io/) | *Portianer is an Web interface for container management.* | *9000* |
| [*minecraft-servrer*](https://hub.docker.com/r/itzg/minecraft-server) | *Setting up a minecraft server.* | *25565* |
| [*emulatorjs*](https://github.com/linuxserver/docker-emulatorjs) | *Web js retro gaming emulator (Not Implemented Yet)* | *80, 3000* |
