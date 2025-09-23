#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"

CONFIGS=(
  "fastfetch"
  "ghostty"
  "hypr"
  "mako"
  "rofi"
  "tmux"
  "waybar"
  "spicetify/Themes"
  "cliphist"
  "gtk-2.0"
  "gtk-3.0"
  "gtk-4.0"
)


CONFIG_FILES=(
  ".zshrc"
  ".zshprofile"
  ".gitconfig"
)

for config in "${CONFIGS[@]}"; do
  source_path="$HOME/.config/$config"
  target_path="$DOTFILES_DIR/configs/$config"

  if [ -d "$source_path" ]; then
    echo "Updating $config..."
    rsync -a --delete --exclude='.git' "$source_path/" "$target_path/"
  else
    echo "Source $source_path not found!"
  fi
done

for config_file in "${CONFIG_FILES}"; do
  source_path="$HOME/$config_file"
  target_path="$DOTFILES_DIR/configs/$config"

  if [ -f "$source_path" ]; then
    echo "Updating $config_file..."
    rsync -a --delete "$source_path" "$target_path/"
  else
    echo "Source $source_path not found!"
  fi
done

rsync -a --delete "$HOME/.config/starship.toml" "$DOTFILES_DIR/configs/$config/"

echo "Configs up to date."
