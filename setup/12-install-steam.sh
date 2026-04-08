#!/usr/bin/env bash

set -x

#Set up a protonfixes config
mkdir -p ~/.config/protonfixes
cp ../dist/protonfix-config.dist ~/.config/protonfixes/config.ini

#Configure mouse polling for FFXIV (which will freak out if the polling rate is too high)
echo "options usbhid mousepoll=2" | sudo tee /etc/modprobe.d/mousepoll.conf
sudo update-initramfs -u

#Install steam deb
cd /tmp

#Steam
wget -O steam_latest.deb https://repo.steampowered.com/steam/archive/precise/steam_latest.deb
sudo gdebi steam_latest.deb
rm -f steam_latest.deb
