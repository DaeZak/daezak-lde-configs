#!/usr/bin/env bash

set -x

echo "Changing to git-working"
cd ~/git-working
echo "Cloning neovim repo"
git clone https://github.com/neovim/neovim.git neovim
cd neovim
echo "Checking out v0.12.1"
git checkout v0.12.1
echo "Building"
make CMAKE_BUILD_TYPE=Release
echo "Installing"
sudo make install
echo "alias vim='nvim'" | sudo tee -a /home/dearly/.bash_aliases
