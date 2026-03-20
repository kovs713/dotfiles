#!/bin/bash
for input in /sys/class/input/input*; do
    if [ "$(cat "$input/phys")" = "isa0060/serio0/input0" ]; then
        echo 1 > "$input/inhibited"
        break
    fi
done