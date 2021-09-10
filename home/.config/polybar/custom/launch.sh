#!/usr/bin/env bash

# Add this script to your wm startup file.

DIR="$HOME/.config/polybar/custom"

# Terminate already running bar instances
killall -q polybar

# Wait until the process have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bar
polybar -q main -c "$DIR"/config.ini &
polybar -q dp -c "$DIR"/config-dp.ini &
