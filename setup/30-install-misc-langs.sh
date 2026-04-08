#!/usr/bin/env bash

set -x

echo "alias python='python3'" | sudo tee -a /home/dearly/.bash_aliases

#Install RUST
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  #For nvim
  cargo install --locked tree-sitter-cli

#Install GO
cd /tmp
wget -O go-current.tar.gz https://go.dev/dl/go1.26.2.linux-amd64.tar.gz
rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go-current.tar.gz
rm -f ./go-current.tar.gz

#Set up to use the Go binaries without messing with PATH in bashrc again
cd /usr/local/bin/
sudo ln -s ../go/bin/go go
sudo ln -s ../go/bin/gofmt gofmt

