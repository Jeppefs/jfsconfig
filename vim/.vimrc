set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" -------------------------------------------------------------------------------- 
" My plugins:

Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" -------------------------------------------------------------------------------- 

" All of your Plugins must be added before the following line

call vundle#end()            " required
filetype plugin indent on    " required
 
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
 
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" --------------------------------------------------------------------------------

" General
set number	
set linebreak	
set showbreak=+++ 	
set textwidth=100	
set showmatch	
" set visualbell	
 
set hlsearch	
set smartcase	
set ignorecase	
set incsearch	
 
set autoindent	
set shiftwidth=4	
set smartindent	
set smarttab	
set softtabstop=4	
 
"audio
set belloff=all

" Advanced
set ruler	
set 
 
set undolevels=1000	
" set backspace=indent,eol,start	
