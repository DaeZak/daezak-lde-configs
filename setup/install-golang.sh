#!/usr/bin/env bash
pushd /tmp
wget https://dl.google.com/go/go1.12.8.linux-amd64.tar.gz
tar -xvf go1.12.8.linux-amd64.tar.gz
mv go /usr/local
chown -R root:root /usr/local/go
rm -f go1.12.8.linux-amd64.tar.gz
popd

echo '' >> ~/.profile
echo 'export GOROOT=/usr/local/go' >> ~/.profile
echo 'export GOPATH=$HOME/git-working/go-workspace' >> ~/.profile
echo 'export PATH=$PATH:$GOROOT/bin' >> ~/.profile
