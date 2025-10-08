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
link "$DOTFILES/wallpapers" "$HOME/wallpapers"

for item in \
  cliphist \
  "Code - insiders" \
  fastfetch \
  ghostty \
  gtk-2.0 \
  gtk-3.0 \
  gtk-4.0 \
  hypr \
  mako \
  rofi \
  spicetify \
  tmux \
  walker \
  waybar
do
  link "$DOTFILES/$item" "$CONFIG_DIR/$item"
done

BIN_DIR="$HOME/.local/bin"
mkdir -p "$BIN_DIR"

for file in "$DOTFILES/bin"/*; do
  if [ -f "$file" ]; then
    link "$file" "$BIN_DIR/$(basename "$file")"
  fi
done

echo "All symlinks installed successfully"
