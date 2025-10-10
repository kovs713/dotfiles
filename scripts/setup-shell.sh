#!/bin/bash

set -e

command -v curl >/dev/null 2>&1 || { echo "curl not installed"; exit 1; }
command -v git >/dev/null 2>&1 || { echo "git not installed"; exit 1; }

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fssl https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

PLUGINS_DIR="$HOME/.oh-my-zsh/custom/plugins"
mkdir -p "$PLUGINS_DIR"

git clone https://github.com/michaelaquilina/zsh-you-should-use.git "$PLUGINS_DIR/you-should-use"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$PLUGINS_DIR/zsh-syntax-highlighting"
