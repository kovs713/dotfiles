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
link "$DOTFILES/xdg-terminals.list" "$CONFIG_DIR/xdg-terminals.list"
link "$DOTFILES/.zshrc" "$HOME/.zshrc"
link "$DOTFILES/.zprofile" "$HOME/.zprofile"
link "$DOTFILES/.ideavimrc" "$HOME/.ideavimrc"

for item in \
  alacritty \
  cliphist \
  fastfetch \
  ghostty \
  hypr \
  kitty \
  swayosd \
  herdr \
  tmux \
  walker \
  wlr-which-key \
  wofi \
  zathura
do
  link "$DOTFILES/$item" "$CONFIG_DIR/$item"
done

# Cleanup legacy waybar symlink (Quattro uses omarchy bar)
if [ -L "$CONFIG_DIR/waybar" ] && [ "$(readlink "$CONFIG_DIR/waybar")" = "$DOTFILES/waybar" ]; then
  rm "$CONFIG_DIR/waybar"
  echo "$CONFIG_DIR/waybar legacy symlink removed [DONE]"
fi

# Only create backgrounds symlink if directory doesn't exist
if [ ! -e "$CONFIG_DIR/omarchy/backgrounds" ]; then
  mkdir -p "$CONFIG_DIR/omarchy"
  ln -s "$DOTFILES/omarchy/backgrounds" "$CONFIG_DIR/omarchy/backgrounds"
  echo "$CONFIG_DIR/omarchy/backgrounds → $DOTFILES/omarchy/backgrounds [DONE]"
else
  echo "$CONFIG_DIR/omarchy/backgrounds already exists, skipping"
fi

link "$DOTFILES/omarchy/themed" "$CONFIG_DIR/omarchy/themed"

# agents skills — single source of truth (dotfiles/agents/skills -> ~/.agents)
link "$HOME/dotfiles/agents" "$HOME/.agents"

echo "All symlinks installed successfully"
