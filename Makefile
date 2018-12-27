.PHONY: all all-linux

all: zsh alacritty vim nvim tmux brew git
all-linux: zsh alacritty vim nvim tmux git bash

zsh:
	[ -f ~/.zshrc ] || ln -s zshrc ~/.zshrc

alacritty:
	mkdir -p ~/.config/alacritty
	[ -f ~/.config/alacritty/alacritty.yml ] || ln -s alacritty.yml ~/.config/alacritty/alacritty.yml

vim:
	[ -f ~/.vimrc ] || ln -s vimrc ~/.vimrc

nvim:
	mkdir -p ~/.config/nvim
	[ -f ~/.config/nvim/init.vim ] || ln -s vimrc ~/.config/nvim/init.vim

brew:
	brew bundle install

brew-update:
	brew bundle dump --force

tmux:
	[ -f ~/.tmux.conf ] || ln -s -f .tmux/tmux.conf ~/.tmux.conf
	[ -f ~/.tmux.conf.local ] || ln -s tmux.conf.local ~/.tmux.conf.local

git:
	[ -f ~/.gitconfig ] || ln -s gitconfig ~/.gitconfig

bash:
	[ -f ~/.bashrc ] || ln -s bashrc ~/.bashrc

clean:
	rm -f ~/.vimrc
	rm -f ~/.config/nvim/init.vim
	rm -f ~/.config/alacritty/alacritty.yml
	rm -f ~/.zshrc
	rm -f ~/.tmux.conf
	rm -f ~/.gitconfig

