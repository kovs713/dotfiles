#!/usr/bin/env bash
set -e

DOTFILES="$HOME/dotfiles/configs"
CONFIG_DIR="$HOME/.config"

echo "Installing symlinks from $DOTFILES..."

link() {
  local src=$1
  local dest=$2

  mkdir -p "$(dirname "$dest")"

  if [ -e "$dest" ] || [ -L "$dest" ]; then
    rm -rf "$dest"
  fi

  ln -s "$src" "$dest"
  echo "$dest → $src [DONE]"
}

link "$DOTFILES/starship.toml" "$CONFIG_DIR/starship.toml"
link "$DOTFILES/.zshrc" "$HOME/.zshrc"
link "$DOTFILES/.zprofile" "$HOME/.zprofile"
link "$DOTFILES/.ideavimrc" "$HOME/.ideavimrc"

for item in \
  alacritty \
  cliphist \
  ghostty \
  hypr \
  tmux \
  waybar \
  wofi \
  walker
do
  link "$DOTFILES/$item" "$CONFIG_DIR/$item"
done

echo "All symlinks installed successfully"
