# --------------------------------------------------------------------------------  
# Impartont default configs
# --------------------------------------------------------------------------------  

export ZSH="/home/jfs/.oh-my-zsh"

ZSH_THEME="bira"
# DISABLE_AUTO_UPDATE="true"
export UPDATE_ZSH_DAYS=14
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(autojump git zsh-syntax-highlighting vi-mode fzf zsh-system-clipboard)

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# SSH connection
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='nvim'
else
	export EDITOR='vim'
fi

# --------------------------------------------------------------------------------  
# Kitty
# --------------------------------------------------------------------------------  

autoload -Uz compinit
compinit
kitty + complete setup zsh | source /dev/stdin

# Set default editor to nvim
export VISUAL=nvim
export EDITOR="$VISUAL"

# --------------------------------------------------------------------------------  
# vi keybindings
# --------------------------------------------------------------------------------  

# Add vi keybinding (source: https://gist.github.com/LukeSmithxyz/e62f26e55ea8b0ed41a65912fbebbe52 )
bindkey -v
export KEYTIMEOUT=1

function zle-keymap-select {
	if [[ ${KEYMAP} == vicmd ]] ||
		 [[ $1 = 'block' ]]; then
		echo -ne '\e[1 q'
	elif [[ ${KEYMAP} == main ]] ||
			 [[ ${KEYMAP} == viins ]] ||
			 [[ ${KEYMAP} = '' ]] ||
			 [[ $1 = 'beam' ]]; then
		echo -ne '\e[5 q'
	fi
}
zle -N zle-keymap-select
zle-line-init() {
		zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
		echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# --------------------------------------------------------------------------------  
# FZF
# --------------------------------------------------------------------------------

# Changes to default fzf commands
export FZF_DEFAULT_COMMAND='rg --files --glob '!exgames''
export FZF_DEFAULT_OPTS='--height=70% --layout=reverse --preview="bat --style=numbers --color=always {} | head -500" --preview-window=right:50%:wrap --bind=tab:down,btab:up,ctrl-space:toggle+down'
export FZF_CTRL_T_COMMAND='rg --files --glob '!exgames''
# export FZF_CTRL_R_COMMAND='print -rl -- ${(u)${(f)"$( rg --hidden --files $1 2> /dev/null )"}:h}'
# export FZF_ALT_C_COMMANDK
D='fi'

