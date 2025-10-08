#!/bin/bash
ITEMS=$(cliphist list)
SELECTED=$(echo "$ITEMS" | walker --dmenu --theme dmenu_250)
if [ -n "$SELECTED" ]; then
  echo "$SELECTED" | cliphist decode | wl-copy
fi
