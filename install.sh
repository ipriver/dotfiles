#!/bin/bash

# Plug-vim for vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# Plug-vim for neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Oh-my-zsh install
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

DIRECTORY="$HOME/.config/alacritty"

if [ ! -d "$DIRECTORY" ]; then
	mkdir -pv "$DIRECTORY"
fi

cp alacritty.yml $DIRECTORY
cp .vimrc $HOME

vim -c ":PlugInstall" -c ":qa"
