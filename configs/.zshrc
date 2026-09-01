# Core tools
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

eval "$(ssh-agent -s)" >/dev/null
ssh-add -q ~/.ssh/id_ed25519_gitlab 2>/dev/null
ssh-add -q ~/.ssh/id_ed25519_git 2>/dev/null

bindkey -v

# Basic settings
setopt autocd autopushd pushdignoredups

# Completion (minimal)
autoload -U compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Autosuggest and syntax highlight 
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

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
alias gc='git commit'
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
alias grbc='git rebase --continue'
alias grba='git rebase --abort'
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
alias dcu="docker compose up"
alias dcd="docker compose down"
alias ff="fastfetch -c /home/kovs/.config/fastfetch/config.jsonc"
alias l="eza --no-filesize --long --color=always --icons=always --no-user"
alias c="clear"
alias v="NVIM_APPNAME=nvim-minimal nvim"
alias vim="nvim"
alias vi="\vim"
alias tn="tmux new -s $(pwd | sed 's/.*\///g')"
alias ta="tmux attach"
alias he="herdr"
alias ss="$HOME/dotfiles/scripts/smart-tmux-session.sh"
alias hss="$HOME/dotfiles/scripts/smart-herdr-session.sh"
alias rmsw="rm ~/.local/state/nvim/swap/*.swp 2>/dev/null"
alias tr="tree -L 1 --dirsfirst"
alias rmspaces="for f in *; do [[ -f '$f' && '$f' == *' '* ]] && mv '$f' '${f// /_}'; done"
alias oc="opencode"
alias lua5.1="lua51"
alias cr="critique"
alias t="tree -I 'node_modules|target|dist' --gitignore"

ytchunks() {
    if [ -z "$1" ]; then
        echo 'usage: ytchunks "youtube-url"'
        return 1
    fi

    yt-dlp \
        -x --audio-format mp3 \
        --embed-thumbnail --add-metadata \
        --split-chapters \
        -o "chapter:$HOME/Music/%(title)s/%(section_title)s.%(ext)s" \
        --paths "temp:$HOME/Music/.ytchunks_tmp" \
        -o "$HOME/Music/.ytchunks_tmp/%(title)s.%(ext)s" \
        --exec "rm -f {}" \
        "$1"
}

bd() {
  find "${1:-.}" -type f -exec bat {} + | wl-copy
}

# keyboard build etc
alias qmkb="qmk compile -kb silakka54 -km vial"
qmkm() {
  sudo mkdir -p /mnt/rpi-rp2
  sudo mount -t vfat /dev/disk/by-label/RPI-RP2 /mnt/rpi-rp2 || return
  sudo cp ~/qmk_firmware/silakka54_vial.uf2 /mnt/rpi-rp2/ || return
  sync
  sudo umount /mnt/rpi-rp2
}

# Nvim plugin remove (0.12 vim.pack API)
nvplrm() {
  name="$1"
  config_dir="$HOME/.config/nvim"
  pack_dir="$HOME/.local/share/nvim/site/pack/core/opt"

  if [ -z "$name" ]; then
    echo "Usage: nvplrm <owner/repo>"
    exit 1
  fi

  repo="${name##*/}"

  # rm from pack.lua 
  escaped_name=$(echo "$name" | sed 's/[[\.*^$/&]/\\&/g')
  sed -i "/src = gh '$escaped_name'/d" "$config_dir/lua/kovs/pack.lua"

  # rm from lock file
  [ -f "$lockfile" ] && rm "$lockfile"

  # rm from pack directory 
  rm -rf "$pack_dir/$repo"

  echo "Removed $name"
}

# Zoxide shortcut
sss() {
    local dir
    dir="$(zoxide query -l | fzf)" && cd "$dir"
}

alias zapret-config="$HOME/zapret-configs/install.sh"
alias zapret-utils="$HOME/zapret-configs/utils-zapret.sh"

# skills -> dotfiles auto-sync (ponytail: symlink already captures files, this auto-commits)
# helper
_dotfiles_skills_sync() {
  [ -d "$HOME/dotfiles/agents/skills" ] || return 0
  for s in "$HOME"/dotfiles/agents/skills/*; do
    [ -e "$s" ] || continue
    base=$(basename "$s")
    [ -e "$HOME/.codex/skills/$base" ] || ln -s "$s" "$HOME/.codex/skills/$base" 2>/dev/null || true
  done
  git -C "$HOME/dotfiles" add agents/skills 2>/dev/null
  if ! git -C "$HOME/dotfiles" diff --cached --quiet 2>/dev/null; then
    git -C "$HOME/dotfiles" commit -m "feat(skills): auto-sync $1 $2" 2>/dev/null
    echo "→ dotfiles/agents/skills auto-committed"
  fi
}
skills() {
  if [ $# -eq 0 ]; then command npx --yes skills; return $?; fi
  command npx --yes skills "$@"
  local ret=$?
  case "$1" in add|a|remove|rm|update|upgrade|experimental_sync) [ $ret -eq 0 ] && _dotfiles_skills_sync "$1" "$2" ;; esac
  return $ret
}
npx() {
  command npx "$@"
  local ret=$?
  local has_skills=0 has_mut=0
  for arg in "$@"; do
    [[ "$arg" == "skills" ]] && has_skills=1
    case "$arg" in add|a|remove|rm|update|upgrade|experimental_sync) has_mut=1 ;; esac
  done
  if [ $has_skills -eq 1 ] && [ $has_mut -eq 1 ] && [ $ret -eq 0 ]; then
    _dotfiles_skills_sync "npx" "skills"
  fi
  return $ret
}
