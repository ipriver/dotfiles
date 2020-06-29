.PHONY: error all-mac all-linux alacritty zsh vim nvim brew brew-update tmux git bash clean p10k

ALACRITTY_CONF_DIR = $(HOME)/.config/alacritty/
NEOVIM_CONF_DIR = $(HOME)/.config/nvim
VIM_CONF_DIR = $(HOME)
ZSH_CONF_DIR = $(HOME)
BASH_CONF_DIR = $(HOME)
GIT_CONF_DIR = $(HOME)
TMUX_CONF_DIR = $(HOME)
P10K_CONF_DIR = $(HOME)

error:
	@echo "Please choose one of the following full installation targets: all-mac, all-linux"
	@echo "Or use singleton targets: zsh, alacritty, vim, nvim, brew, brew-update, tmux, git, bash, clean"
	@exit 2

all-mac: zsh alacritty vim nvim tmux brew git
all-linux: zsh alacritty vim nvim tmux git bash

zsh:
	@echo "$@: Linking zsh config into $(ZSH_CONF_DIR) directory."
	@if [ -f $(ZSH_CONF_DIR)/.zshrc ]; then rm -f $(ZSH_CONF_DIR)/.zshrc; fi;
	@ln -sfn $(shell pwd)/zshrc $(ZSH_CONF_DIR)/.zshrc
	@echo "$@: Complete"

p10k:
	@echo "$@: Linking p10k zsh theme config into $(P10K_CONF_DIR) directory."
	@if [ -f $(P10K_CONF_DIR)/.p10k.zsh ]; then rm -f $(P10K_CONF_DIR)/.p10k.zsh; fi;
	@ln -sfn $(shell pwd)/p10k.zsh $(P10K_CONF_DIR)/.p10k.zsh
	@echo "$@: Complete"

alacritty:
	@echo "$@: Linking Alacritty config into $(ALACRITTY_CONF_DIR) directory."
	@mkdir -p $(ALACRITTY_CONF_DIR)
	@if [ -f $(ALACRITTY_CONF_DIR)/alacritty.yml ]; then rm -f $(ALACRITTY_CONF_DIR)/alacritty.yml; fi;
	@ln -sfn $(shell pwd)/alacritty.yml $(ALACRITTY_CONF_DIR)/alacritty.yml
	@echo "$@: Complete"

vim:
	@echo "$@: Linking Vim config into $(VIM_CONF_DIR) directory."
	@if [ -f $(VIM_CONF_DIR)/.vimrc ]; then rm -f $(VIM_CONF_DIR)/.vimrc; fi;
	@ln -sfn $(shell pwd)/vimrc $(VIM_CONF_DIR)/.vimrc
	@echo "$@: Complete"

nvim:
	@echo "$@: Linking NeoVim config into $(NEOVIM_CONF_DIR) directory."
	@mkdir -p $(NEOVIM_CONF_DIR)
	@if [ -f $(NEOVIM_CONF_DIR)/init.vim ]; then rm -f $(NEOVIM_CONF_DIR)/init.vim; fi;
	@ln -sfn $(shell pwd)/vimrc $(NEOVIM_CONF_DIR)/init.vim
	@echo "$@: Complete"

brew:
	brew bundle install

tmux:
	@if [ -d $(shell pwd)/.tmux ]; then rm -fr .tmux; fi;
	@echo "$@: Cloning .tmux template config repository from gpakosz/.tmux"
	@git clone https://github.com/gpakosz/.tmux.git
	@echo "$@: Finished cloning"
	@echo "$@: Linking tmux configs into $(TMUX_CONF_DIR) directory."
	@ln -sfn $(shell pwd)/.tmux/.tmux.conf $(TMUX_CONF_DIR)/.tmux.conf
	@ln -sfn $(shell pwd)/tmux.conf.local $(TMUX_CONF_DIR)/.tmux.conf.local
	@echo "$@: Complete"

git:
	@echo "$@: Linking .gitconfig into $(GIT_CONF_DIR) directory."
	@if [ -f $(GIT_CONF_DIR)/.gitconfig ]; then rm -f $(GIT_CONF_DIR)/.gitconfig; fi;
	@ln -sfn $(shell pwd)/gitconfig $(GIT_CONF_DIR)/.gitconfig
	@echo "$@: Complete"

bash:
	@echo "$@: Linking bash config into $(BASH_CONF_DIR) directory."
	@if [ -f $(BASH_CONF_DIR)/.bashrc ]; then rm -f $(BASH_CONF_DIR)/.bashrc; fi;
	@ln -sfn $(shell pwd)/bashrc $(BASH_CONF_DIR)/.bashrc
	@echo "$@: Complete"

clean:
	rm -f $(VIM_CONF_DIR)/.vimrc
	rm -f $(NEOVIM_CONF_DIR)/init.vim
	rm -f $(ALACRITTY_CONF_DIR)/alacritty.yml
	rm -f $(ZSH_CONF_DIR)/.zshrc
	rm -f $(BASH_CONF_DIR)/.bashrc
	rm -f $(TMUX_CONF_DIR)/.tmux.conf
	rm -f $(GIT_CONF_DIR)/.gitconfig

