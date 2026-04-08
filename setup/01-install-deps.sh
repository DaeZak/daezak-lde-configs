#!/usr/bin/env bash

set -x

apt update
sudo apt upgrade -y
sudo apt autoremove
apt-get install -y \
    p7zip-full \
    p7zip-rar \
    ripgrep \
    bison \
    build-essential \
    cabextract \
    ccache \
    cmake \
    curl \
    devscripts \
    equivs \
    exfatprogs \
    gettext \
    fdisk \
    flex \
    fzf \
    gdebi \
    git \
    htop \
    imagemagick \
      #Deps of imagemagick
      libpng-dev \
      libjpeg-dev \
      libtiff-dev \
      libwebp-dev \
      webp \
    jq \
    mysql-client-core-8.0 \
    ninja-build \
    postgresql-client-common \
    python3-dev \
    python3-gpg \
    software-properties-common \
    snapd \
    sqlite3 \
    tmux \
    tree \
    wl-clipboard \
    wget

#Cursor and git-lfs
