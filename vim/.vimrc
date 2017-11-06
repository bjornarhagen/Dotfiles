call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'jisaacks/GitGutter'
Plug 'mattn/emmet-vim'
Plug 'justinmk/vim-sneak'
Plug 'ntpeters/vim-better-whitespace'
" Plug 'Valloric/YouCompleteMe'
Plug 'vim-syntastic/syntastic'
Plug 'ap/vim-css-color'
Plug 'bling/vim-airline'
Plug 'junegunn/vim-easy-align'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'pangloss/vim-javascript'
Plug 'dylanaraps/wal.vim'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'bearhagen/vim-hybrid-material'
" Plug 'powerline/powerline'
Plug 'matze/vim-move'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()

syntax enable

" Set color scheme with pywal
" colorscheme wal
colorscheme custom

" Show line numers
set number
set numberwidth=5

" Always open NERDTree
autocmd vimenter * NERDTree

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

imap <c-space> <plug>(fzf-complete-line)
nnoremap <c-p> :Files<cr>
inoremap <c-p> <Esc>:Files<cr>

