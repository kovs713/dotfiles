#!/usr/bin/env bash
set -euo pipefail

current_theme_dir="$HOME/.local/state/omarchy/current/theme"
config_file="$HOME/.config/wlr-which-key/config.yaml"
tmp_file="$(mktemp --suffix=.yaml)"

cleanup() {
  rm -f "$tmp_file"
}

trap cleanup EXIT

toml_color() {
  sed -n "s/^[[:space:]]*$1[[:space:]]*=[[:space:]]*\"\(#[0-9a-fA-F]\{3,8\}\)\".*/\1/p" "$2" | head -n1
}

gen_colors() {
  local toml="$1"
  printf 'background: "%s"\n' "$(toml_color background "$toml")"
  printf 'color: "%s"\n' "$(toml_color foreground "$toml")"
  printf 'border: "%s"\n' "$(toml_color accent "$toml")"
}

if [[ -f "$current_theme_dir/wlr-which-key-colors.yaml" ]]; then
  cat "$current_theme_dir/wlr-which-key-colors.yaml" "$config_file" > "$tmp_file"
elif [[ -f "$current_theme_dir/colors.toml" ]]; then
  { gen_colors "$current_theme_dir/colors.toml"; cat "$config_file"; } > "$tmp_file"
else
  theme_name="$(cat "$HOME/.local/state/omarchy/current/theme.name" 2>/dev/null || true)"
  theme_dir="$(omarchy-theme-dir "$theme_name" 2>/dev/null || true)"
  if [[ -n "${theme_dir:-}" && -f "$theme_dir/colors.toml" ]]; then
    { gen_colors "$theme_dir/colors.toml"; cat "$config_file"; } > "$tmp_file"
  else
    exec wlr-which-key "$config_file"
  fi
fi

exec wlr-which-key "$tmp_file"
