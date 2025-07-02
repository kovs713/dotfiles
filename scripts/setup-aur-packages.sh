#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "Please, run script as root (sudo)."
  exit 1
fi

echo "📦 Updating AUR-packages via paru..."

if ! command -v paru &> /dev/null; then
  echo "📦 Insalling paru..."
  pacman -S --noconfirm base-devel git
  git clone https://aur.archlinux.org/paru.git 
  cd paru && makepkg -si --noconfirm && cd ..
fi

paru -S --noconfirm - < paru.txt
