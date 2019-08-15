#!/usr/bin/env bash
cp ~/Downloads/jdk-8u221-linux-x64.tar.gz /tmp
pushd /tmp

tar -zxvf jdk-8u221-linux-x64.tar.gz
mv jdk1.8.0_221 /usr/lib/jvm
chown -R root:root /usr/lib/jvm/jdk1.8.0_221

rm -f /tmp/jdk-8u221-linux-x64.tar.gz

update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk1.8.0_221/bin/java 1090


