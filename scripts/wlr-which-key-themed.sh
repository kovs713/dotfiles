#!/usr/bin/env bash
set -euo pipefail

current_theme_dir="$HOME/.local/state/omarchy/current/theme"
config_file="$HOME/.config/wlr-which-key/config.yaml"
tmp_file="$(mktemp --suffix=.yaml)"

cleanup() {
  rm -f "$tmp_file"
}

trap cleanup EXIT

# Extract a hex color from an omarchy colors.toml:  key = "#rrggbb"
toml_color() {
  sed -n "s/^[[:space:]]*$1[[:space:]]*=[[:space:]]*\"\(#[0-9a-fA-F]\{3,8\}\)\".*/\1/p" "$2" | head -n1
}

# Emit wlr-which-key theming keys derived from a colors.toml
gen_colors() {
  local toml="$1"
  printf 'background: "%s"\n' "$(toml_color background "$toml")"
  printf 'color: "%s"\n' "$(toml_color foreground "$toml")"
  printf 'border: "%s"\n' "$(toml_color accent "$toml")"
}

if [[ -f "$current_theme_dir/wlr-which-key-colors.yaml" ]]; then
  # Theme ships dedicated colors for wlr-which-key
  cat "$current_theme_dir/wlr-which-key-colors.yaml" "$config_file" > "$tmp_file"
elif [[ -f "$current_theme_dir/colors.toml" ]]; then
  { gen_colors "$current_theme_dir/colors.toml"; cat "$config_file"; } > "$tmp_file"
else
  # Fall back to the active theme's own directory (e.g. user-installed themes)
  theme_name="$(cat "$HOME/.local/state/omarchy/current/theme.name" 2>/dev/null || true)"
  theme_dir="$(omarchy-theme-dir "$theme_name" 2>/dev/null || true)"
  if [[ -n "${theme_dir:-}" && -f "$theme_dir/colors.toml" ]]; then
    { gen_colors "$theme_dir/colors.toml"; cat "$config_file"; } > "$tmp_file"
  else
    # No theme colors anywhere; run unthemed rather than fail
    exec wlr-which-key "$config_file"
  fi
fi

exec wlr-which-key "$tmp_file"
