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
    gdebi \
    git \
    htop \
    jq \
    mysql-client-core-8.0 \
    ninja-build \
    postgresql-client-common \
    python3-dev \
    python3-gpg \
    software-properties-common \
    sqlite3 \
    tmux \
    tree \
    wget

#Cursor and git-lfs
