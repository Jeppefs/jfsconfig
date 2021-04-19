#!/bin/bash

dmenu_extended_cache_build

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
polybar main &
polybar secondary &

echo "Polybar launched..."

## Launch Programs
i3-msg 'workspace 1; exec kitty -o background_opacity=0.9'
sleep 1
i3-msg 'move scratchpad'
sleep 1

# TODO: Make secondary firefox move to workspace 9
i3-msg 'workspace 1; exec firefox; gaps current inner set 0'
sleep 2
# i3-msg 'focus left'
# sleep 1
i3-msg 'move container to workspace 9'
sleep 1

i3-msg 'workspace 5; exec code $HOME/myconfig'
sleep 5
i3-msg 'workspace 5; exec kitty -d $HOME/myconfig'
sleep 1

i3-msg workspace Q
sleep 5
i3-msg 'workspace Welcome; exec kitty' 
sleep 1
i3-msg 'split v'
i3-msg 'workspace Welcome; exec "kitty --hold --detach neofetch"'
sleep 1 

i3-msg 'workspace 10; exec discord'
sleep 5

i3-msg workspace Q
