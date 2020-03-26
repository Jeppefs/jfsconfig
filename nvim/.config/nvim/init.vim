"jfs nvim config

"-------------------------------------------------------------------------------
"Outlines a new section
""subsection
"/outcommented code
"Normal comment

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
set autoindent noexpandtab tabstop=2 shiftwidth=2
hi MatchParen cterm=bold ctermbg=green ctermfg=red

set wrap
set linebreak
"set columns=100

autocmd VimResized * wincmd =

let g:vim_markdown_folding_style_pythonic = 1


"-------------------------------------------------------------------------------
"Mouse
set mouse=a

"-------------------------------------------------------------------------------
"Keyboard remappings
let mapleader =" "

"Change file using fzf 
nnoremap <C-p> :FZF <ENTER>

"Make ctrl+hjkl move focus in vim windows
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

"??? 
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

"Move visual up or down
nnoremap <C-Up> <C-y>
nnoremap <C-Down> <C-e>

"-------------------------------------------------------------------------------
"General plugin settings

"-------------------------------------------------------------------------------
"Latex
let g:tex_flavor = 'latex'

"-------------------------------------------------------------------------------
"Markdown
let g:pandoc#spell#enabled = 0

"-------------------------------------------------------------------------------
"Plugins
call plug#begin()
Plug 'joshdick/onedark.vim'
Plug 'tpope/vim-commentary'
Plug 'machakann/vim-sandwich'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'godlygeek/tabular'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax' 
Plug 'lervag/vimtex'
Plug 'DougBeney/pickachu'
call plug#end()

"-------------------------------------------------------------------------------
"Colorshceeme settings
"let g:onedark_terminal_italics = 1
"colorscheme onedark



"-------------------------------------------------------------------------------
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
