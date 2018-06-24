#!/bin/bash

DIRECTORY="$HOME/.config/alacritty"

if [ ! -d "$DIRECTORY" ]; then
	mkdir $DIRECOTRY	
fi

cp alacritty.yml $DIRECTORY

