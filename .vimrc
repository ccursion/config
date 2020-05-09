set nocompatible

" Initialize plugin system
call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-surround'
Plug 'flazz/vim-colorschemes'
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

syntax enable
set hidden
set mouse=a
set ttymouse=xterm2
set tabstop=4
set softtabstop=4
set expandtab
set number
set wildmenu
set showmatch
set foldenable
set foldmethod=indent
set foldlevelstart=10
set foldnestmax=10

set incsearch
set hlsearch

let mapleader=","
nnoremap <leader><space> :nohlsearch<CR>
" Space toggles folds
nnoremap <space> za
inoremap jk <esc>

" Window movement (unnecessary with bindings handled by vim-tmux-navigator plugin)
"nnoremap <C-h> <C-w>h
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l
inoremap <C-h> <Esc><C-w>h
inoremap <C-j> <Esc><C-w>j
inoremap <C-k> <Esc><C-w>k
inoremap <C-l> <Esc><C-w>l

" Buffer navigation
nnoremap <TAB> :bnext<CR>
nnoremap <S-TAB> :bnext<CR>

" Color scheme overriding cursor highlighting
set cursorline
augroup ColorOverride
        autocmd!
                autocmd ColorScheme * highlight CursorColumn ctermbg=234
                        \ | highlight CursorLine  ctermbg=234
                augroup END
colorscheme dracula

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = "angr"

" EasyMotion
let g:EasyMotion_do_mapping = 1

