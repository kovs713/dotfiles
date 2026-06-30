#!/usr/bin/env bash
set -euo pipefail

# Pick directory from zoxide through fzf
selected_dir="$(zoxide query -l | fzf || true)"

# Exit if nothing selected
if [ -z "${selected_dir:-}" ]; then
    exit 0
fi

# Build a safe Herdr session name from directory name
session_name="$(
    basename "$selected_dir" |
    sed -E 's/[[:space:].]+/_/g; s/[^[:alnum:]_-]+/_/g; s/^_+|_+$//g'
)"

# Fallback if basename became empty after sanitizing
if [ -z "$session_name" ]; then
    session_name="herdr"
fi

cd "$selected_dir" || exit 1

# If already inside Herdr, switch/attach current client to that named session.
# Otherwise start/attach Herdr normally.
if [ -n "${HERDR_ENV:-}" ]; then
    herdr session attach "$session_name"
else
    exec herdr --session "$session_name"
fi
