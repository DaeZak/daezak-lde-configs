#!/usr/bin/env bash

set -x

cd /tmp

#Discord
wget -O discord-latest.deb https://discord.com/api/download?platform=linux
sudo gdebi discord-latest.deb
rm -f discord-latest.deb

#Google Chrome
wget -O google-chrome-stable.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo gdebi google-chrome-stable.deb
rm -f google-chrome.stable.deb

#ImHex Hex Editor
wget -O imhex_x86_64.deb https://github.com/WerWolv/ImHex/releases/download/v1.38.1/imhex-1.38.1-Ubuntu-24.04-x86_64.deb
sudo gdebi imhex_x86_64.deb
rm -f imhex_x86_64.deb

#VeraCrypt
wget -O veracrypt-amd64.deb https://launchpad.net/veracrypt/trunk/1.26.24/+download/veracrypt-1.26.24-Ubuntu-24.04-amd64.deb
sudo gdebi veracrypt-amd64.deb
rm -f veracrypt-amd64.deb
