ZSH_THEME=""

ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

plugins=(
  battery
  brew
  colorize
  zsh-autosuggestions
  zsh-syntax-highlighting
  sudo
  command-not-found
  cp
  history
  web-search
  golang
  docker
  jsontools
  last-working-dir # lwd
  npm
  pip
  python
  redis-cli
  vi-mode
  vscode
  node # fast node-docs
  yarn
  # tmux # reports error in alacritty
  colored-man-pages
  git
)

# Path to your oh-my-zsh installation.
export ZSH="/Users/${USER}/.oh-my-zsh"
# source $ZSH/oh-my-zsh.sh # speed bottleneck

# User configuration

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# For a full list of active aliases, run `alias`.
alias zshrc="nvim ~/.zshrc"
alias vimrc="nvim ~/.vimrc"
alias alacrc="nvim ~/.config/alacritty/alacritty.yml"

alias tis="tig status"
alias gis="git status"
alias ls='ls -GpF' # Mac OSX specific
alias ll='ls -alGpF' # Mac OSX specific

export GOPATH="${HOME}/go"
# export GOROOT="$(brew --prefix golang)/libexec" # speed bottleneck
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
export MYVIMRC="${HOME}/.vimrc"

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Pure theme configuratoin
autoload -U promptinit; promptinit
prompt pure

