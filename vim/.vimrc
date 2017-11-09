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


" Ctrl+p to find files
nnoremap <c-p> :Files<cr>
inoremap <c-p> <Esc>:Files<cr>

" Ctrl+shift+f to find a line
noremap <c-s-f> :Lines<cr>
inoremap <c-s-f> <Esc>:Lines<cr>

" Custom keybindings "
inoremap <c-x> <Esc> <Shift-v>

" Allow sudo save with w!!
cmap w!! w !sudo tee > /dev/null %

noremap <c-o> :!xclip -selection clipboard <<< "%:p:h"<cr>



