export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="gnzh"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

alias ls='ls --color=auto'
alias g='git'
alias t='tmux new -s'
alias vim='nvim'
alias cls="clear"

fastfetch --logo ~/.wallpapers/bogopodoben.jpg

export PATH=$PATH:/home/kamusari/.spicetify

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
