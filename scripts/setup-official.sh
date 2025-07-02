#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "Please, run script as root (sudo)."
  exit 1
fi

echo "🔄 Updating system..."
pacman -Syu --noconfirm

echo "📦 Updating packages from pacman..."
pacman -S --noconfirm - < pacman.txt

echo "✅ Setup official packages has done!"
