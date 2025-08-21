eval "$(starship init zsh)"

export ZSH="$HOME/.oh-my-zsh"
export LANG=en_US.UTF-8

plugins=(git)

source $ZSH/oh-my-zsh.sh

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

source /home/kovs/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# source /home/kovs/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh 

source /usr/share/zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
