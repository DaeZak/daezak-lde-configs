#!/usr/bin/env bash

#Install additional dev and productivity tooling
apt-get install -y \
    hexchat \
    krita \
    podman \
    podman-compose \
    podman-docker \
    # for podman-docker dependency
    python3-setuptools \
    vlc

#Install AWS CLI
cd /tmp
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf ./aws/
rm -f ./awscliv2.zip

#Install Claude Code
curl -fsSL https://claude.ai/install.sh | bash
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc && source ~/.bashrc

#Install Cursor
cd /tmp
wget -O cursor.deb https://api2.cursor.sh/updates/download/golden/linux-x64-deb/cursor/3.0
sudo gdebi cursor.deb
rm -f cursor.deb

#Install additional Neovim Dependencies
npm install -g neovim @mermaid-js/mermaid-cli

cd /tmp
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
LAZYGIT_ARCH=$(uname -m | sed -e 's/aarch64/arm64/')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_${LAZYGIT_ARCH}.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/
rm -rf ./lazygit/
rm -f ./lazygit.tar.gz

#Podman - silence emulation message
sudo touch /etc/containers/nodocker

#Install Slack from flatpak because slack are a bunch of butt heads
flatpak install slack

