#!/bin/bash
echo "Installing vim configs and updating vim"

mv ~/.vimrc ~/vimrc.BAK
mv ~/.vim ~/vim.BAK

cp vim/.vimrc ~/
cp -r vim/.vim ~/

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && \
  vim +PluginInstall +qall

echo "Done."
