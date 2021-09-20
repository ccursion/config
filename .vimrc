set nocompatible

"# Plugins
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'qpkorr/vim-bufkill'
Plug 'dense-analysis/ale'

call plug#end()

"## Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = "dracula"

"## EasyMotion
let g:EasyMotion_do_mapping = 1

"# General
syntax enable
set hidden
set mouse=a
set ttymouse=xterm2
set number
set wildmenu
set modeline
set modelineexpr
set nowrap

"# Folds
set foldenable
set foldmethod=indent
set foldlevelstart=10
set foldnestmax=5

"# Indentation
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set smarttab
filetype indent on

"# Search
set incsearch
set hlsearch
set showmatch
set ignorecase

"# Keybindings
let mapleader=","
nnoremap <leader><space> :nohlsearch<CR>
" Space toggles folds
nnoremap <space> za
inoremap jk <esc>

"## Window Navigation
"let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_disable_when_zoomed = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

" Buffer navigation
nnoremap <TAB> :bnext<CR>
nnoremap <S-TAB> :bnext<CR>

"# Color Scheme
" Color scheme overriding highlighting
set cursorline
set cursorcolumn
augroup ColorOverride
        autocmd!
                autocmd ColorScheme * highlight CursorColumn ctermbg=234
                        \ | hi CursorLine  ctermbg=234
                        \ | hi debugPC  ctermbg=234
                        \ | hi Folded ctermbg=233
                        \ | hi LineNr ctermfg=004
                        \ | hi IncSearch ctermbg=008
                        \ | hi Search ctermbg=008
                        \ | hi Visual ctermbg=008
                augroup END
colorscheme dracula


"# vimrc folding
" vim:fdm=expr:fdl=0
" vim:fde=getline(v\:lnum)=~'^"#'?'>'.(matchend(getline(v\:lnum),'"#*')-1)\:'='
