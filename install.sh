#!/bin/bash

# Oh-my-zsh install
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

DIRECTORY="$HOME/.config/alacritty"
if [ ! -d "$DIRECTORY" ]; then
	mkdir -p "$DIRECTORY"
fi
cp alacritty.yml $DIRECTORY

DIRECTORY="$HOME/.tmux"
if [ ! -d "$DIRECTORY" ]; then
	mkdir -p "$DIRECTORY"
fi
cp .tmux.conf $DIRECOTRY

cp .vimrc $HOME

vim -c ":PlugInstall" -c ":qa"
