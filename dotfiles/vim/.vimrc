
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: 
" Matthieu Court — matthieu.court@protonmail.com
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key remaps general confs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=500

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set ignorecase " Ignore case when searching
set smartcase " When searching try to be smart about cases 
set hlsearch " Highlight search results
set incsearch " Makes search act like search in modern browsers
set lazyredraw " Don't redraw while executing macros (good performance config)
set magic " For regular expressions turn magic on
set showmatch " Show matching brackets when text indicator is over them
set mat=2 " How many tenths of a second to blink when matching brackets

" No annoying sound on errors
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

set encoding=utf8 " Set utf8 as standard encoding and en_US as the standard language
set ffs=unix,dos,mac " Use Unix as the standard file type
set expandtab " Use spaces instead of tabs
set smarttab " Be smart when using tabs ;)
set shiftwidth=4 " 1 tab == 4 spaces
set tabstop=4
set lbr " Linebreak on 500 characters
set tw=500
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status Line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2 " Always show the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c " Format the status line


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use fzf to search files with CTRL+p
nnoremap <silent> <C-p> :Files<CR>

" Finding it more pleasant to not open NerdTree on run
nnoremap <C-t> :NERDTreeToggle<CR>

" Use ripgrep to search inside a file with LEADER+f
" Note: ripgrep must be installed
nnoremap <silent> <Leader>f :Rg<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins using VimPlug 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight VertSplit cterm=NONE

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'kyoz/purify', { 'rtp': 'vim' }
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'doums/darcula'
Plug 'ajmwagar/vim-deus'
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'
Plug 'preservim/NERDTree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'derekwyatt/vim-scala'
Plug 'bling/vim-airline'

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mouse settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=a


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => To paste correctly with tmux
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if &term =~ "screen"
    let &t_BE = "\e[?2004h"
    let &t_BD = "\e[?2004l"
    exec "set t_PS=\e[200~"
    exec "set t_PE=\e[201~"
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Automatically save and load folds for all filtetypes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colour schemes & other visuals
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Start NERDTree and put the cursor back in the other window.
"autocmd VimEnter * NERDTree | wincmd p
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

:set showtabline=1
" turn hybrid line / relative lines
:set number relativenumber
:set nu rnu
:set pastetoggle=<F2>

set termguicolors

syntax enable
set foldcolumn=0
set background=dark   " Ensure dark mode is set
let g:gruvbox_contrast_dark = 'soft'
let g:fzf_layout = { 'down': '~40%' }

colorscheme darcula

