call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'jisaacks/GitGutter'
Plug 'mattn/emmet-vim'
Plug 'justinmk/vim-sneak'
Plug 'ntpeters/vim-better-whitespace'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-syntastic/syntastic'
Plug 'ap/vim-css-color'
Plug 'bling/vim-airline'
Plug 'junegunn/vim-easy-align'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'pangloss/vim-javascript'
Plug 'dylanaraps/wal.vim'

call plug#end()

" Set color scheme with pywal
colorscheme wal

" Always open NERDTree
autocmd vimenter * NERDTree

" Custom keybind for vim-move
let g:move_key_modifier = 'c-s'

" Custom keybind for select next highlighted
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_start_key='<C-d>'

