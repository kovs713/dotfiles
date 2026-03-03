#!/usr/bin/env bash

set -euo pipefail

DISCORD_DIR="/opt/discord"

if [[ $# -lt 1 ]]; then
    echo "Usage: $(basename "$0") <discord.tar.gz>"
    exit 1
fi

ARCHIVE="$1"

if [[ ! -f "$ARCHIVE" ]]; then
    echo "Error: Archive not found: $ARCHIVE"
    exit 1
fi

echo "Installing Discord from: $ARCHIVE"

TEMP_DIR=$(mktemp -d)
trap 'rm -rf "$TEMP_DIR"' EXIT

tar -xzf "$ARCHIVE" -C "$TEMP_DIR"

rm -rf "$DISCORD_DIR"
mv "$TEMP_DIR/Discord" "$DISCORD_DIR"

if [[ -x "$DISCORD_DIR/postinst.sh" ]]; then
    echo "Running postinst.sh..."
    "$DISCORD_DIR/postinst.sh"
fi

ln -sf "$DISCORD_DIR/Discord" /usr/local/bin/discord
echo "Done. Run 'discord' to start."
