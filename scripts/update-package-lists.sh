#!/bin/bash

pacman -Qqe > packages/all.txt

yay -Qmq > packages/aur.txt

comm -23 <(sort packages/all.txt) <(comm -12 <(sort packages/all.txt) <(yay -Qmq | sort)) > packages/official.txt
