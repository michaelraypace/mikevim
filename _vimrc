source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

filetype off
execute pathogen#infect()
syntax on
filetype plugin indent on
map <C-l> :NERDTreeToggle<CR>
set nocompatible
set modelines=0
let mapleader =","
inoremap jk <ESC>
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" set the runtime path to include Vundle and initialize
set rtp+=%HOME%/vimfiles/bundle/Vundle.vim/
call vundle#begin('%USERPROFILE%/vimfiles/bundle/')
Plugin 'VundleVim/Vundle.vim'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdcommenter'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'tpope/vim-surround'
Plugin 'leafgarland/typescript-vim'
Plugin 'godlygeek/tabular'
Plugin 'mxw/vim-jsx'
Plugin 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"
" Coming Home to Vim
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set undofile
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set undofile
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85
set number
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk
nnoremap ; :
nnoremap <leader>v V`]

" ,ev to edit vimrc
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
" ,sv to source vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" ,w to open workspace vertical
nnoremap <leader>w <C-w>v<C-w>l

color molokai

" Workspace
cd c:\Users\mpace\Desktop\scripts

"Strictly necessary for Powerline
set encoding=utf-8
"Set to whatever font you like.
set guifont=Inconsolata\ for\ Powerline:h12
 
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

" nerd tree
nnoremap <leader>lk <c-w>h
nnoremap <leader>kl <c-w>l

" How to JSON Format File
com! FormatJSON %!python -m json.tool

" Custom surround
nnoremap ,swq ysiw"

au FileType html set ft=jsx
au FileType jsx runtime! ftplugin/html/sparkup.vim

" highlight ip addrs
syn match ipaddr /\(\(25\_[0-5]\|2\_[0-4]\_[0-9]\|\_[01]\?\_[0-9]\_[0-9]\?\)\.\)\{3\}\(25\_[0-5]\|2\_[0-4]\_[0-9]\|\_[01]\?\_[0-9]\_[0-9]\?\)/
hi link ipaddr Identifier
