#!/bin/bash

DIRECTORY="$HOME/.config/alacritty"

if [ ! -d "$DIRECTORY" ]; then
	mkdir -pv "$DIRECTORY"
fi

cp alacritty.yml $DIRECTORY
cp .vimrc $HOME
