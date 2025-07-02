#!/bin/bash

pacman -Qqe > all.txt

paru -Qmq > paru.txt

comm -23 <(sort all.txt) <(comm -12 <(sort all.txt) <(paru -Qmq | sort)) > pacman.txt

echo "✅ List has updated: pacman.txt, paru.txt"
