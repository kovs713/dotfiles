# Core tools
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# disable vi mode
bindkey -e

# Basic settings
export LANG=en_US.UTF-8
setopt autocd autopushd pushdignoredups

# Completion (minimal)
autoload -Uz compinit
compinit -C

# Editor
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR="vim"
else
  export EDITOR="nvim"
fi

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory sharehistory

# Git aliases (OMZ git plugin compatible)
alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gb='git branch'
alias gba='git branch --all'
alias gbd='git branch --delete'
alias gbD='git branch --delete --force'
alias gbm='git branch --move'
alias gbnm='git branch --no-merged'
alias gbr='git branch --remote'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gcB='git checkout -B'
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'
alias gclean='git clean --interactive -d'
alias gcl='git clone --recurse-submodules'
alias gcmsg='git commit --message'
alias gc='git commit --verbose'
alias gca='git commit --verbose --all'
alias gf='git fetch'
alias gfo='git fetch origin'
alias glol='git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --all'
alias glo='git log --oneline --decorate --graph --all'
alias gl='git pull'
alias glr='git pull --rebase'
alias gp='git push'
alias gpd='git push --dry-run'
alias gpf='git push --force'
alias gpv='git push --verbose'
alias gpu='git push upstream'
alias grb='git rebase'
alias gr='git remote'
alias grv='git remote --verbose'
alias gra='git remote add'
alias grrm='git remote remove'
alias grset='git remote set-url'
alias grup='git remote update'
alias grh='git reset'
alias grhh='git reset --hard'
alias grhk='git reset --keep'
alias grhs='git reset --soft'
alias grs='git restore'
alias grss='git restore --source'
alias grst='git restore --staged'
alias grm='git rm'
alias grmc='git rm --cached'
alias gst='git status'
alias gss='git status --short'
alias gsb='git status --short --branch'
alias gsw='git switch'
alias gswc='git switch --create'
alias gswd='git switch $(git_develop_branch)'
alias gswm='git switch $(git_main_branch)'
alias gignore='git update-index --assume-unchanged'
alias gunignore='git update-index --no-assume-unchanged'

# Other aliases
alias ls="ls --color=auto"
alias cls="clear"
alias vim="nvim"
alias vi="\vim"
alias tn="tmux new -s $(pwd | sed 's/.*\///g')"
alias ss="/home/kovs/dotfiles/scripts/smart-session.sh"
alias rmsw="rm ~/.local/state/nvim/swap/*.swp 2>/dev/null"
alias tr="tree -L 1 --dirsfirst"
alias rmspaces="for f in *; do [[ -f '$f' && '$f' == *' '* ]] && mv '$f' '${f// /_}'; done"
alias oc="opencode"
alias lua5.1="lua51"

# Zoxide shortcut
sss() {
    local dir
    dir="$(zoxide query -l | fzf)" && cd "$dir"
}

# Lazy load NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && export NVM_SOURCE="$NVM_DIR/nvm.sh"

nvm() {
  unset -f nvm node npm npx 2>/dev/null
  [ -s "$NVM_SOURCE" ] && . "$NVM_SOURCE"
  nvm "$@"
}

node() {
  unset -f nvm node npm npx 2>/dev/null
  [ -s "$NVM_SOURCE" ] && . "$NVM_SOURCE"
  node "$@"
}

npm() {
  unset -f nvm node npm npx 2>/dev/null
  [ -s "$NVM_SOURCE" ] && . "$NVM_SOURCE"
  npm "$@"
}

npx() {
  unset -f nvm node npm npx 2>/dev/null
  [ -s "$NVM_SOURCE" ] && . "$NVM_SOURCE"
  npx "$@"
}

# Paths
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# pnpm
export PNPM_HOME="/home/kovs/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

alias zapret-config="$HOME/zapret-configs/install.sh"
alias zapret-utils="$HOME/zapret-configs/utils-zapret.sh"
