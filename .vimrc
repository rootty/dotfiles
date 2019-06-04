syntax on
color dracula
set number
set relativenumber
set numberwidth=2 " Keep the line number gutter narrow so three digits is cozy.
set ignorecase
set smartcase
set showmatch
set ruler
set incsearch
set hlsearch
set wildmenu            " visual autocomplete for command menu
set ts=2 sts=2 sw=2 expandtab
" indent when moving to the next line while writing code
set autoindent
set foldenable          " enable folding

filetype indent on " load filetype-specific indent files

let mapleader=","       " leader is comma


nnoremap <leader><space> :nohlsearch<CR> " turn off search highlight

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
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'matze/vim-move'
Plug 'dracula/vim', { 'as': 'dracula' }

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Initialize plugin system
call plug#end()

" toggle between number and relativenumber. :call ToggleNumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction


" Save temporary/backup files not in the local directory, but in your ~/.vim
" directory, to keep them out of git repos.
" But first mkdir backup, swap, and undo first to make this work
call system('mkdir ~/.vim')
call system('mkdir ~/.vim/backup')
call system('mkdir ~/.vim/swap')
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    call system('mkdir ~/.vim/undo')
    set undodir=~/.vim/undo//
    set undofile
    set undolevels=1000
    set undoreload=10000
endif
