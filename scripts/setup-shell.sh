#!/bin/bash

set -e

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sudo pacman -S zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search
fi
