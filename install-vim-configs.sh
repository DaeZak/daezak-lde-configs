#!/bin/bash
echo "Installing vim configs and updating vim"

if [ -f "$HOME/.vimrc" ]; then
  echo "Backing up .vimrc to vimrc.BAK"
  mv ~/.vimrc ~/vimrc.BAK
fi

if [ -d "$HOME/.vim" ]; then
  echo "Backing up .vim directory to vim.BAK/"
  mv ~/.vim ~/vim.BAK
fi

cp vim/vimrc-file ~/.vimrc
cp -r vim/vim-dir ~/.vim

echo "Installing vundle and vundle plugins"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && \
  vim +PluginInstall +qall

echo "If you haven't already - you may want to install powerline fonts for vim airline plugin!"
echo "Done."
