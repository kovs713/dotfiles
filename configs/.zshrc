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
  export EDITOR="vim"
else
  export EDITOR="nvim"
fi

alias ls="ls --color=auto"
alias g="git"
alias tn="tmux new -s $(pwd | sed 's/.*\///g')"
alias vim="nvim"
alias vi="\vim"
alias cls="clear"
alias gst="git status -s"
alias ss="/home/kovs/dotfiles/scripts/smart-session.sh"
sss() {
    local dir
    dir="$(zoxide query -l | fzf)" && cd "$dir"
}
alias rmsw="rm ~/.local/state/nvim/swap/*.swp 2>/dev/null"
alias tr="tree -L 1 --dirsfirst"
alias rmspaces="for f in *; do [[ -f '$f' && '$f' == *' '* ]] && mv '$f' '${f// /_}'; done"
alias oc="opencode"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# pnpm
export PNPM_HOME="/home/kovs/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

alias zapret-config="$HOME/zapret-configs/install.sh"
alias zapret-utils="$HOME/zapret-configs/utils-zapret.sh"
