#!/bin/bash

set -x

cd /tmp
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/RobotoMono.zip
unzip -d robotmono RobotoMono.zip
rm -f RobotoMono.zip
sudo mv robotmono/*.ttf /usr/share/fonts/
rm -rf /tmp/robotomono
ls -alh /usr/share/fonts/
sudo fc-cache -vf
