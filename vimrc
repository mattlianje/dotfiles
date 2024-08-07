"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Matthieu Court — matthieu.court@protonmail.com
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" => Key remaps general confs
set history=500

set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set ignorecase 
set smartcase 
set hlsearch 
set incsearch 
set lazyredraw 
set magic 
set showmatch 
set mat=2 

set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

set encoding=utf8 
set ffs=unix,dos,mac 

set list

set lbr 
set tw=500
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


" Return to last edit position when opening files 
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" => Status Line
set laststatus=2 
set statusline=%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c 

" => General
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>t :below terminal<CR>

" NerdTree has been canned
nnoremap <C-t> :Lexplore<CR>
let g:netrw_winsize = 25 
let g:netrw_browse_split = 4 
let g:netrw_mouse = 1 
let g:netrw_banner = 0 
let g:netrw_liststyle = 3 
let g:netrw_altv = 1 
set fillchars+=vert:\

" => Misc / Buffers
" Of couse we are using my org-mode like ZOB tool
map <leader>n :tabe ~/zob/buffer.md<cr>
map <leader>pp :setlocal paste!<cr>
nnoremap <Leader>b :ls<CR>:b<Space>
map <C-J> :bnext<CR>
map <C-K> :bprev<CR>
map <C-H> gT
map <C-L> gt

" => Helper functions
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction


" => Plugins using VimPlug
highlight VertSplit cterm=NONE

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'kyoz/purify', { 'rtp': 'vim' }
Plug 'preservim/NERDTree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'derekwyatt/vim-scala'
Plug 'bling/vim-airline'

call plug#end()

" => Mouse settings
set mouse=a


" => To paste correctly with tmux
if &term =~ "screen"
    let &t_BE = "\e[?2004h"
    let &t_BD = "\e[?2004l"
    exec "set t_PS=\e[200~"
    exec "set t_PE=\e[201~"
endif

" => Automatically save and load folds for all filtetypes
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview


" => Colour schemes & other visuals
:set showtabline=1
:set number relativenumber
:set nu rnu
:set pastetoggle=<F2>
set termguicolors

syntax enable
set foldcolumn=0
set background=dark   " Ensure dark mode is set
let g:gruvbox_contrast_dark = 'soft'
let g:fzf_layout = { 'down': '~40%' }

