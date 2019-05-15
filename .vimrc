syntax on
set number
set relativenumber
set ignorecase
set smartcase
set showmatch
set ruler
set hlsearch
set wildmenu            " visual autocomplete for command menu
set ts=2 sts=2 sw=2 expandtab
" indent when moving to the next line while writing code
set autoindent

map <C-n> :NERDTreeToggle<CR>
\
cmap w!! w !sudo tee % >/dev/null

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'sheerun/vim-polyglot'
Plug '~/.fzf'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Initialize plugin system
call plug#end()
