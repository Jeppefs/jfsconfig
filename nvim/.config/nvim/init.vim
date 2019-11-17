"jfs nvim config

"-------------------------------------------------------------------------------
"Outlines a new section
""subsection
"/outcommented code
":Normal comment

"--------------------------------------------------------------------------------
"On autosave
":Removes trailing whitespaces
" autocmd BufWritePre * :%s/\s\+$//

"-------------------------------------------------------------------------------
"System configuration
set notimeout
set clipboard=unnamedplus
set incsearch
set ignorecase
set smartcase

"-------------------------------------------------------------------------------
"Visuals
set number relativenumber
set nu rnu
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
"/ set tabstop=2
set autoindent noexpandtab tabstop=2 shiftwidth=2

"-------------------------------------------------------------------------------
"Mouse
set mouse=a

"-------------------------------------------------------------------------------
"Keyboard remappings
let mapleader =" "

nnoremap <C-p> :FZF <ENTER>

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

"-------------------------------------------------------------------------------
"Plugins
call plug#begin()
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
call plug#end()
