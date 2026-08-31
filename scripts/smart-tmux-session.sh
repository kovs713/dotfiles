#!/usr/bin/env bash
set -euo pipefail

# -n/--new forces a new unique session even if one exists for the dir
new_flag=0
[[ "${1:-}" == "-n" || "${1:-}" == "--new" ]] && new_flag=1

# Pick directory from zoxide through fzf
selected_dir="$(zoxide query -l | fzf || true)"

# Exit if nothing selected
if [ -z "${selected_dir:-}" ]; then
    exit 0
fi

# Sanitized basename + 4-hex hash of full path (short, unique per path)
base="$(basename "$selected_dir" | sed -E 's/[[:space:].]+/_/g; s/[^[:alnum:]_-]+/_/g; s/^_+|_+$//g')"
[ -z "$base" ] && base="tmux"
hash="$(printf '%s' "$selected_dir" | cksum | awk '{printf "%04x", $1 % 65535}')"
session_name="${base}_${hash}"

# If --new and name collides, find next free suffix: name-2, name-3 ...
if [ "$new_flag" -eq 1 ]; then
    orig="$session_name"; n=2
    while tmux has-session -t "=$session_name" 2>/dev/null; do
        session_name="${orig}-${n}"; n=$((n+1))
        # fallback to random if many collisions
        [ "$n" -gt 99 ] && session_name="${orig}_$(printf '%04x' $((RANDOM % 65535)))" && break
    done
fi

# Switch to the tmux session if it already exists, otherwise create it
if ! tmux has-session -t "=$session_name" 2>/dev/null; then
    tmux new-session -d -s "$session_name" -c "$selected_dir"
fi

if [ -n "${TMUX:-}" ]; then
    tmux switch-client -t "=$session_name"
else
    tmux attach-session -t "=$session_name"
fi
