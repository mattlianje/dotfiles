"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Matthieu Court (matthieu.court@protonmail.com)
" - 2020-2025
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctrl-p      files
" ctrl-t      tree
" ctrl-j/k    next/prev buffer
" ctrl-h/l    prev/next tab
" space b     buffers
" space l     search file
" space f     grep proj
" space h     recent
" space q     close buf
" space e     new buf
" space n     zob notes
" space t     terminal

" leader
let mapleader = " "

" core
set nocompatible
set encoding=utf8
set history=500
set mouse=a
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" search
set ignorecase
set smartcase
set hlsearch
set incsearch

" visuals
set number relativenumber
set showmatch
set lazyredraw
set nowrap
set laststatus=2
set showtabline=1
set noerrorbells
set novisualbell
set t_vb=
set nolist
set listchars=tab:>-,trail:·
syntax enable
colorscheme evening
let g:airline#extensions#tabline#enabled = 1

" indentation
set autoindent
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4

" persistence
set undofile
set undodir=~/.vim/undo
set viewoptions=folds,cursor
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent! loadview
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" netrw
let g:netrw_winsize = 25
let g:netrw_browse_split = 4
let g:netrw_banner = 0
let g:netrw_liststyle = 3

" keymaps
nnoremap <C-p> :Files<CR>
nnoremap <Leader>f :Rg<CR>
nnoremap <Leader>t :below terminal<CR>
nnoremap <C-t> :Lexplore<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>l :BLines<CR>
nnoremap <Leader>h :History<CR>
nnoremap <Leader>q :bd<CR>
nnoremap <Leader>n :tabe ~/zob/buffer.md<CR>
nnoremap <Leader>e :enew<CR>
nnoremap <C-J> :bnext<CR>
nnoremap <C-K> :bprev<CR>
nnoremap <C-H> gT
nnoremap <C-L> gt
set pastetoggle=<F2>

" plugins
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'derekwyatt/vim-scala'
call plug#end()

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.6, 'border': 'rounded' } }
let $FZF_DEFAULT_OPTS = '--reverse --border'

" tmux
if &term =~ "screen"
    let &t_BE = "\e[?2004h"
    let &t_BD = "\e[?2004l"
    exec "set t_PS=\e[200~"
    exec "set t_PE=\e[201~"
endif
