#!/usr/bin/env bash
set -euo pipefail

command -v ssh-keygen >/dev/null 2>&1 || { echo "Нужен ssh-keygen. Установи OpenSSH."; exit 1; }

SSH_DIR="${HOME}/.ssh"
mkdir -p "$SSH_DIR"
BASE_NAME="id_ed25519_git"
KEY_PATH="${SSH_DIR}/${BASE_NAME}"

if [ -e "${KEY_PATH}" ] || [ -e "${KEY_PATH}.pub" ]; then
  TS=$(date +%Y%m%d_%H%M%S)
  KEY_PATH="${SSH_DIR}/${BASE_NAME}_${TS}"
fi

COMMENT="$(git config --get user.email 2>/dev/null || true)"
if [ -z "$COMMENT" ]; then
  COMMENT="${USER}@$(hostname -f 2>/dev/null || hostname)"
fi

ssh-keygen -t ed25519 -C "$COMMENT" -f "$KEY_PATH" -N "" >/dev/null

PUB="${KEY_PATH}.pub"
if [ ! -f "$PUB" ]; then
  echo "smth went wrong: $PUB" >&2
  exit 1
fi

cat "$PUB"

if [ -z "$SSH_AUTH_SOCK" ]; then
  eval "$(ssh-agent -s)"
fi

ssh-add "$KEY_PATH"
