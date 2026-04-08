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

#Install Git LFS
cd /tmp
wget -O git-lfs-3.7.1.tar.gz 'https://release-assets.githubusercontent.com/github-production-release-asset/13021798/4f9e9226-0b66-4975-a44e-d434b27097de?sp=r&sv=2018-11-09&sr=b&spr=https&se=2026-04-08T18%3A11%3A21Z&rscd=attachment%3B+filename%3Dgit-lfs-linux-amd64-v3.7.1.tar.gz&rsct=application%2Foctet-stream&skoid=96c2d410-5711-43a1-aedd-ab1947aa7ab0&sktid=398a6654-997b-47e9-b12b-9515b896b4de&skt=2026-04-08T17%3A10%3A44Z&ske=2026-04-08T18%3A11%3A21Z&sks=b&skv=2018-11-09&sig=IB02Pg24wCSh4vE%2Fx%2FsX4FjP0QBsu5UEnhcoF1dtZoY%3D&jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmVsZWFzZS1hc3NldHMuZ2l0aHVidXNlcmNvbnRlbnQuY29tIiwia2V5Ijoia2V5MSIsImV4cCI6MTc3NTY2OTQ3MCwibmJmIjoxNzc1NjY5MTcwLCJwYXRoIjoicmVsZWFzZWFzc2V0cHJvZHVjdGlvbi5ibG9iLmNvcmUud2luZG93cy5uZXQifQ.z3uzzKZLTnAragwiAQqmhsOOZe0s2oFeV6Af_sNzRqw&response-content-disposition=attachment%3B%20filename%3Dgit-lfs-linux-amd64-v3.7.1.tar.gz&response-content-type=application%2Foctet-stream'
tar -xvf git-lfs-3.7.1.tar.gz
sudo ./git-lfs-3.7.1/install.sh
rm -rf ./git-lfs-3.7.1
rm -f git-lfs-3.7.1.tar.gz

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

