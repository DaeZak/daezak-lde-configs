#!/usr/bin/env bash

add-apt-repository -y ppa:obsproject/obs-studio
apt-get udpate

apt-get install -y \
    ffmpeg \
    obs-studio
