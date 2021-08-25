#!/bin/bash

dmenu_extended_cache_build

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
polybar main &
sleep 1
polybar secondary &

echo "Polybar launched..."

## Launch Programs
i3-msg 'workspace 1; exec kitty -o background_opacity=0.9'
sleep 1
i3-msg 'move scratchpad'
sleep 1

i3-msg 'workspace 1; exec firefox; gaps current inner set 0'
sleep 3

i3-msg 'workspace 10; exec discord'
sleep 8

i3-msg 'workspace Q'
i3-msg 'exec emacs'
