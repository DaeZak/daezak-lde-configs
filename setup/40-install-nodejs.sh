#!/usr/bin/env bash

set -x

echo "Downloading nvm install script"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash
echo "Verifying"
command -v nvm
echo "Installing Node 20.20.0"
source ~/.bashrc
nvm install 20.20.0
