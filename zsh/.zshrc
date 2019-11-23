# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# --------------------------------------------------------------------------------  
# Impartant default configs
# --------------------------------------------------------------------------------  

# Path to your oh-my-zsh installation.
export ZSH="/home/jfs/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="bira"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Which plugins would you like to load?
# Example format: plugins=(rails git textmate ruby lighthouse)
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
# Custom Widgets 
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
export FZF_DEFAULT_OPTS='--height=70% --layout=reverse --preview="nvim {}" --preview-window=right:50%:wrap --bind=tab:down,btab:up,ctrl-space:toggle+down'
export FZF_CTRL_T_COMMAND='rg --files --glob '!exgames''
# export FZF_CTRL_R_COMMAND='print -rl -- ${(u)${(f)"$( rg --hidden --files $1 2> /dev/null )"}:h}'
# export FZF_ALT_C_COMMANDK
D='fi'

# --------------------------------------------------------------------------------  
# Custom functions
# --------------------------------------------------------------------------------

# Terminal global path using fzf just like ALT_C 
# __fsel() {
#   local cmd="find . type -d find ~ -type d \( -path "*.git" -o -path "*magic-the-gathering-arena" -o -path "*.dropbox*" \) -prune -o -print | fzf"
    
#   setopt localoptions pipefail 2> /dev/null
#   eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse $FZF_DEFAULT_OPTS $FZF_CTRL_T_OPTS" $(__fzfcmd) -m "$@" | while read item; do
#     echo -n "${(q)item} "
#   done
#   local ret=$?
#   echo
#   return $ret
# }

# __fzf_use_tmux__() {
#   [ -n "$TMUX_PANE" ] && [ "${FZF_TMUX:-0}" != 0 ] && [ ${LINES:-40} -gt 15 ]
# }

# __fzfcmd() {
#   __fzf_use_tmux__ &&
#     echo "fzf-tmux -d${FZF_TMUX_HEIGHT:-40%}" || echo "fzf"
# }

# fzf-file-widget() {
#   LBUFFER="${LBUFFER}$(__fsel)"
#   local ret=$?
#   zle reset-prompt
#   return $ret
# }
# zle     -N   fzf-file-widget
# bindkey '^O' fzf-file-widget

# fzf-redraw-prompt() {
#   local precmd
#   for precmd in $precmd_functions; do
#     $precmd
#   done
#   zle reset-prompt
# }
# zle -N fzf-redraw-prompt

# --------------------------------------------------------------------------------  
# Aliases
# --------------------------------------------------------------------------------

alias copy='kitty +kitten clipboard'
alias gitall='git add * && git commit -m'
alias fr='rifle "$(fzf)"'
alias pS='sudo pacman -S'
alias vim='nvim'
alias vimdiff='nvim -d'
alias ll='exa -l'
alias ls='exa -a'
alias cc='cdAndls'

cdAndls() {
	cd $1 &&
	ls;
}

# --------------------------------------------------------------------------------  
# Keybindings
# --------------------------------------------------------------------------------
function copyPath() {pwd | kitty +kitten clipboard}
zle -N copyPath
bindkey ^b copyPath 

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"