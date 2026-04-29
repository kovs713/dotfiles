#!/usr/bin/env bash
set -euo pipefail

theme_file="$HOME/.config/omarchy/current/theme/wlr-which-key-colors.yaml"
config_file="$HOME/.config/wlr-which-key/config.yaml"
tmp_file="$(mktemp --suffix=.yaml)"

cleanup() {
  rm -f "$tmp_file"
}

trap cleanup EXIT

cat "$theme_file" "$config_file" > "$tmp_file"
exec wlr-which-key "$tmp_file"
