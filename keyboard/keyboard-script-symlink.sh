#!/usr/bin/env bash

sudo ln -sf /home/kovs/dotfiles/keyboard/99-external-keyboard.rules /etc/udev/rules.d/99-external-keyboard.rules

sudo udevadm control --reload
sudo udevadm trigger
