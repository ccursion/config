set nocompatible

"# Plugins
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar'
Plug 'christoomey/vim-tmux-navigator'
Plug 'qpkorr/vim-bufkill'
Plug 'dense-analysis/ale'
Plug 'dracula/vim',{'as':'dracula'}
Plug 'scrooloose/nerdtree'
"Plug 'valloric/youcompleteme'
Plug 'andrewradev/bufferize.vim'

call plug#end()

"## Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = "dracula"
let g:airline_powerline_fonts = 1

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

"# Tags
let g:easytags_file = '~/.vim/tags'

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

"# WSL yank support
set clipboard+=unnamedplus
"let s:clip = '/mnt/c/Windows/System32/clip.exe'
"if executable(s:clip)
"    augroup WSLYank
"        autocmd!
"        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
"    augroup END
"endif

"# Color Scheme
" Color scheme overriding highlighting
set cursorline
set cursorcolumn
augroup ColorOverride
        autocmd!
                autocmd ColorScheme * highlight CursorColumn ctermbg=234
                        \ | hi CursorLine  ctermbg=234
                        \ | hi Cursor  ctermfg=004
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
