# Environment variables
export LANG=en_US.UTF-8
export PHONE_MAC_ADDRESS=A4:C6:F0:C0:7A:54
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PNPM_HOME="/home/kovs/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
export PATH=$PATH:/home/kovs/.spicetify
export _ZO_EXCLUDE_DIRS="$HOME/.local/*:$HOME/Work:/mnt/*"

# NVM
export NVM_DIR="$HOME/.nvm"

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

# pnpm
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Hyprland on TTY1
if [ "$(tty)" = "/dev/tty1" ];then   
    exec Hyprland 
fi
