eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

export ZSH="$HOME/.oh-my-zsh"
export LANG=en_US.UTF-8

plugins=(
  git
  you-should-use
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

alias ls='ls --color=auto'
alias g='git'
alias tn='tmux new -s $(pwd | sed "s/.*\///g")'
alias vim='nvim'
alias cls="clear"
alias gst="git status -s"
alias ss="/home/kovs/dotfiles/scripts/smart-session.sh"
alias rmsw="rm ~/.local/state/nvim/swap/*.swp 2>/dev/null"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/home/kovs/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
