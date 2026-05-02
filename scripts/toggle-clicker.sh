#!/usr/bin/env bash

DELAY_MS=50          
BUTTON=3 # 1=ЛКМ, 2=СКМ, 3=ПКМ             
PIDFILE="/tmp/autoclicker_toggle.pid"

notify() { notify-send "Autoclicker" "$1" -t 1000 2>/dev/null || echo "Autoclicker: $1"; }

# STOP
if [ -f "$PIDFILE" ]; then
    PID=$(cat "$PIDFILE")
    if kill -0 "$PID" 2>/dev/null; then
        kill "$PID" 2>/dev/null
        pkill -P "$PID" 2>/dev/null  # Child sleep-processes
        rm -f "$PIDFILE"
        notify "Stopped"
        exit 0
    else
        rm -f "$PIDFILE"
    fi
fi

# START
if command -v xdotool &>/dev/null; then
    while true; do
        xdotool click "$BUTTON"
        sleep "$(echo "scale=3; $DELAY_MS/1000" | bc)"
    done &>/dev/null &
elif command -v ydotool &>/dev/null; then
    while true; do
        ydotool click "$BUTTON" 1
        ydotool click "$BUTTON" 0
        sleep "$(echo "scale=3; $DELAY_MS/1000" | bc)"
    done &>/dev/null &
else
    notify "xdotool or ydotool not found"
    exit 1
fi

echo $! > "$PIDFILE"
notify "Started (PID: $!)"
