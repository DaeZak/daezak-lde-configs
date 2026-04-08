#!/usr/bin/env bash

set -x

pushd /tmp
wget -O adoptium-temurin-jdk.tar.gz https://github.com/adoptium/temurin25-binaries/releases/download/jdk-25.0.2%2B10/OpenJDK25U-jdk_x64_linux_hotspot_25.0.2_10.tar.gz
tar -zxvf adoptium-temurin-jdk.tar.gz
sudo mv jdk-25.0.2+10 /usr/lib/jvm
sudo chown -R root:root /usr/lib/jvm/jdk-25.0.2+10

rm -f /tmp/adoptium-temurin-jdk.tar.gz

sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk-25.0.2+10/bin/java 2500


