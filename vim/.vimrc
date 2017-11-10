" ----------------------------- "
" ---      Load plugins     --- "
" ----------------------------- "

call plug#begin('~/.vim/plugged')

" Functional
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'																						" Fuzzy finder
Plug 'matze/vim-move'																							" Move lines or blocks of code up and down with k and j
Plug 'tpope/vim-surround'																					" Change what sorrounds the code you are inside
Plug 'vim-airline/vim-airline'																		" Lean & mean status/tabline
Plug 'easymotion/vim-easymotion'																	" Search highlight and jump to result
Plug 'terryma/vim-multiple-cursors'																" Allow multiple cursors
" Web dev
Plug 'mattn/emmet-vim'																						" Emmet
Plug 'othree/html5.vim'																						" HTML5 omnicomplete and syntax
Plug 'ap/vim-css-color'																						" Color highlighter
Plug 'lumiliet/vim-twig'																					" Twig templating syntax
Plug 'Shutnik/jshint2.vim'																				" Detect JS errors
Plug 'jwalton512/vim-blade'																				" Blade templating syntax
Plug 'hail2u/vim-css3-syntax'																			" CSS3 & SASS syntax highlighting
Plug 'pangloss/vim-javascript'																		" Improved Javascript indentation and syntax
Plug 'nathanaelkane/vim-indent-guides'														" Show indentation
" Visual
Plug 'junegunn/goyo.vim'																					" Distraction free mode
Plug 'scrooloose/nerdtree'																				" Sidebar
Plug 'airblade/vim-gitgutter'																			" Shows which lines have been added/removed/changed
Plug 'vim-syntastic/syntastic'																		" runs syntax checkers and displays any errors
Plug 'ntpeters/vim-better-whitespace'															" Highlights trailing whitespace
" Aesthetics
Plug 'tomasr/molokai'
Plug 'sickill/vim-monokai'
Plug 'dylanaraps/wal.vim'																					" Colorscheme based on wallpaperi
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'bearhagen/vim-hybrid-material'

call plug#end()


" ----------------------------- "
" --- Plugins customization --- "
" ----------------------------- "

" Always open NERDTree and focus active window
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

" Custom keybind for vim-move
let g:move_key_modifier = 'c-s'

" Custom keybind for select next highlighted
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_start_key='<C-d>'

" fzf config
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" run JSHint when a file with .js extension is saved
" this requires the jsHint2 plugin
autocmd BufWritePost *.js silent :JSHint

" ----------------------------- "
" --- General customization --- "
" ----------------------------- "

" encoding is utf 8
set encoding=utf-8
set fileencoding=utf-8

" Turn on sytnax highlighting
syntax enable
colorscheme monokai
" We want the background to be set by wal (pywal)
hi Normal                 ctermbg=none guibg=none
hi Number                 ctermbg=none guibg=none
hi NonText                ctermbg=none guibg=none
hi LineNr                 ctermbg=none guibg=none
hi Foldcolumn             ctermbg=none guibg=none
hi Relativenumber         ctermbg=none guibg=none
hi DiffAdd                ctermbg=none guibg=none ctermfg=148 guifg=#a6e22e
hi GitGutterAddDefault    ctermbg=none guibg=none ctermfg=148 guifg=#a6e22e
hi DiffChange             ctermbg=none guibg=none ctermfg=186 guifg=#e6db74
hi GitGutterChangeDefault ctermbg=none guibg=none ctermfg=186 guifg=#e6db74
hi DiffDelete             ctermbg=none guibg=none ctermfg=197 guifg=#f92672
hi GitGutterDeleteDefault ctermbg=none guibg=none ctermfg=197 guifg=#f92672
hi DiffText               ctermbg=none guibg=none ctermfg=231 guifg=#f8f8f2 

" Detect file type and load plugins
filetype on
filetype plugin on
filetype indent on

" line numers, left padding, tab width and don't wrap
" set number
set relativenumber
set foldcolumn=3
set tabstop=2
set nowrap

" keep the cursor visible within 3 lines when scrolling
set scrolloff=7

" reload files changed outside vim
set autoread

" by default, in insert mode backspace won't delete over line breaks, or
" automatically-inserted indentation, let's change that
set backspace=indent,eol,start

" dont't unload buffers when they are abandoned, instead stay in the
" background
set hidden

" set unix line endings
set fileformat=unix
" when reading files try unix line endings then dos, also use unix for new
" buffers
set fileformats=unix,dos

" remove the .ext~ files, but not the swapfiles
set nobackup
set writebackup
set noswapfile

" search settings
set incsearch        " find the next match as we type the search
set hlsearch         " hilight searches by default
" use ESC to remove search higlight
nnoremap <esc> :noh<return><esc>

" ----------------------------- "
" ---      Keybindings      --- "
" ----------------------------- "

" windows like clipboard
" yank to and paste from the clipboard without prepending "* to commands
let &clipboard = has('unnamedplus') ? 'unnamedplus' : 'unnamed'
" map c-x and c-v to work as they do in windows, only in insert mode
vm <c-x> "+x
vm <c-c> "+y
cno <c-v> <c-r>+
exe 'ino <script> <C-V>' paste#paste_cmd['i']

" save with ctrl+s
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a

" use <C-Space> for Vim's keyword autocomplete
"  ...in the terminal
inoremap <Nul> <C-n>
"  ...and in gui mode
inoremap <C-Space> <C-n>

" Ctrl+p to find files
nnoremap <c-p> :Files<cr>
inoremap <c-p> <Esc>:Files<cr>

" Search in file
noremap <c-f> /
inoremap <c-f> <Esc>/

" Ctrl+shift+f to find a line
noremap <c-s-f> :Lines<cr>
inoremap <c-s-f> <Esc>:Lines<cr>

" Allow sudo save with w!!
cmap w!! w !sudo tee > /dev/null %

" Copy file folder path to clipboard
noremap <c-o> :!xclip -selection clipboard <<< "%:p:h"<cr>

" Emmet
let g:user_emmet_expandabbr_key='<Tab>'
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" Make selections
inoremap <s-Home> <Esc>v<Home>
inoremap <s-End> <Esc>v<End>
inoremap <s-PageUp> <Esc>v<PageUp>
inoremap <s-PageDown> <Esc>v<PageDown>
inoremap <s-Up> <Esc>v<Up>
inoremap <s-Right> <Esc><Right>v<Right>
inoremap <s-Down>  <Esc>v<Down>
inoremap <s-Left> <Esc><Right>v<Left>

" ----------------------------- "
" ---       File types      --- "
" ----------------------------- "

" Sets syntax to use for file extentions
autocmd BufNewFile,BufRead *.md setlocal ft=markdown
autocmd BufNewFile,BufRead *.twig setlocal ft=php
autocmd BufNewFile,BufRead *.blade setlocal ft=php
