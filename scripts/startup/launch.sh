i3-msg workspace Welcome 
sleep 1
code /$HOME/Dropbox/Lists
sleep 1
i3-msg 'workspace Welcome; exec kitty' 
#kitty --hold --detach 
sleep 1
i3-msg 'split v'
i3-msg 'kitty --hold --detach neofetch'
