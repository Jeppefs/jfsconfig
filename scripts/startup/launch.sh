i3-msg 'workspace 1; exec kitty' 
sleep 1 

i3-msg 'workspace 2; exec firefox'
sleep 1

i3-msg workspace 5
code /$HOME/myconfig
kitty 
echo "cd /$HOMR/myconfig"

i3-msg 'workspace 8; exec spotify'
i3-msg 'workspace 8; exec discord'

i3-msg workspace Welcome 
sleep 1
code /$HOME/Dropbox/Lists
sleep 1
i3-msg 'workspace Welcome; exec kitty' 
sleep 1
i3-msg 'split v'
i3-msg 'workspace Welcome; exec "kitty --hold --detach neofetch"'

