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

