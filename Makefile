
all: zsh alacritty vim nvim tmux

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

tmux:
	[ -f ~/.tmux.conf ] || ln -s -f .tmux/tmux.conf ~/.tmux.conf
	[ -f ~/.tmux.conf.local ] || ln -s tmux.conf.local ~/.tmux.conf.local

clean:
	rm -f ~/.vimrc
	rm -f ~/.config/nvim/init.vim
	rm -f ~/.config/alacritty/alacritty.yml
	rm -f ~/.zshrc
	rm -f ~/.tmux.conf

.PHONY: all
