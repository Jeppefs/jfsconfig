"""jfs nvim config

"-------------------------------------------------------------------------------
"Plugins {{{1

"-------------------------------------------------------------------------------
call plug#begin()
"Themes
Plug 'gruvbox-community/gruvbox'

"Visuals
Plug 'junegunn/goyo.vim'

"File navigation
Plug 'junegunn/fzf.vim'
Plug 'yuki-ycino/fzf-preview.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'voldikss/vim-floaterm'

"QOL
Plug 'machakann/vim-sandwich'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'godlygeek/tabular'
Plug 'DougBeney/pickachu'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired' " Adds additional shortcuts
Plug 'easymotion/vim-easymotion'

"Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"Language server
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Filetypes
Plug 'lervag/vimtex'                                   " LaTeX
"Plug 'vim-pandoc/vim-pandoc'                           " Pandoc syntax
"Plug 'vim-pandoc/vim-pandoc-syntax'                    " Markdown syntax
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'} " Python syntax
Plug 'tmhedberg/SimpylFold'                            " Python folding

"Ending plugins
" Plug 'ryanoasis/vim-evicons'

call plug#end()
"-------------------------------------------------------------------------------
"Theme {{{1
"-------------------------------------------------------------------------------
syntax on "has to be at the top
colorscheme gruvbox
let g:gruvbox_italic = '(1)'
let g:gruvbox_contrast_dark = '(hard)'
highlight Normal guibg=none guifg=none

"-------------------------------------------------------------------------------
"System configuration {{{1
"-------------------------------------------------------------------------------
set notimeout
set clipboard=unnamedplus
set incsearch
set ignorecase
set smartcase
set encoding=utf-8
set virtualedit=block
set autoindent
set showcmd
set foldmethod=marker
set wildignore+=*.aux,*.out,*.toc 

"-------------------------------------------------------------------------------
"Visuals {{{1
"-------------------------------------------------------------------------------
set number relativenumber
set nu rnu
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set autoindent noexpandtab tabstop=2 shiftwidth=2
"hi MatchParen cterm=bold ctermbg=green ctermfg=red

set wrap
set linebreak
"set columns=100

set list
autocmd VimResized * wincmd =

let g:vim_markdown_folding_style_pythonic = 1
set foldlevel=20
"vim augroup highlight_yank autocmd! autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("IncSearch", 1000) augroup END

"-------------------------------------------------------------------------------
"Mouse {{{1
"-------------------------------------------------------------------------------
set mouse=a

"Use ALT+MOUSE1 in visual block mode
noremap <M-LeftMouse> <4-LeftMouse>
inoremap <M-LeftMouse> <4-LeftMouse>
onoremap <M-LeftMouse> <C-C><4-LeftMouse>
noremap <M-LeftDrag> <LeftDrag>
inoremap <M-LeftDrag> <LeftDrag>
onoremap <M-LeftDrag> <C-C><LeftDrag>

"-------------------------------------------------------------------------------
"Keyboard remappings {{{1
"-------------------------------------------------------------------------------
let mapleader = "\<Space>" " Let Space be mapleader

"Change file using fzf_preview
nnoremap <C-p> :FzfPreviewDirectoryFiles <ENTER>
nnoremap <Leader>f :FzfPreviewGitFiles <ENTER>

"Make ctrl+hjkl move focus in vim windows in normal mode
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

"Make j and k work like gk and gj but only when count is 1
nnoremap <expr> k v:count == 0 ? 'gk' : 'k'
nnoremap <expr> j v:count == 0 ? 'gj' : 'j'

"???
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

"Move visual up or down
nnoremap <C-Up> <C-y>
nnoremap <C-Down> <C-e>

"Tabularize to the right with selected character 
"WHat the hell is <expr>?
nnoremap <expr> <Leader>. ':Tabularize /^\s*\S.*\zs' . split(&commentstring, '%s')[0] . "<CR>"

"Give backwards jump back to ctrl-I (COC overwrites it)
nnoremap <C-[> <C-i>

"-------------------------------------------------------------------------------
"Custom Commands {{{1
"-------------------------------------------------------------------------------
:command XRemoveWhiteSpace :%s/\s\+$//e "333
:command XTabularizeComment :Tabularize /^\s*\S.*\zs " XXXDoesn't work yet...

"-------------------------------------------------------------------------------
"General plugin settings {{{1
"-------------------------------------------------------------------------------
let g:fzf_preview_command = 'bat --color=always --style=grid {-1}'
let g:UltiSnipsExpandTrigger = "Nop" "disable the ultisnips autoexpand - I use tab with coc instead
let g:UltiSnipsSnippetDirectories=["MySnippets"]

""" Floaterm {{{2
let g:floaterm_keymap_new    = '<F7>'
let g:floaterm_keymap_prev   = '<F8>'
let g:floaterm_keymap_next   = '<F9>'
let g:floaterm_keymap_toggle = '<F10>'

""" vim-tex {{{2
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

""" COC {{{2
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
" set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else:set ve=all
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
xmap <silent> <TAB> <Plug>(coc-range-select)
nmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


"-------------------------------------------------------------------------------
" Filetypes {{{1
"-------------------------------------------------------------------------------

"Latex {{{2
let g:tex_flavor = 'latex'

"Markdown {{{2
let g:pandoc#spell#enabled = 0
hi! link markdownH1 blue


"-------------------------------------------------------------------------------
" Custom functions {{{1
"-------------------------------------------------------------------------------
function! NeatFoldText() "{{{2
  let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
  let foldchar = matchstr(&fillchars, 'fold:\zs.')
  let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(foldchar, 8)
  let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
  return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction
set foldtext=NeatFoldText()
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
