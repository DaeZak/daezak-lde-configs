" Enable vim fanciness
set nocompatible
filetype off " required for Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'git://github.com/tomtom/tplugin_vim.git'        "General plugin mgmt component
Plugin 'https://github.com/ctrlpvim/ctrlp.vim.git'      "CtrlP file search for vim
Plugin 'https://github.com/vim-syntastic/syntastic.git' "Syntastic syntax checking

Plugin 'https://github.com/rust-lang/rust.vim.git'      "Syntax file for rust
Plugin 'vim-perl/vim-perl'                              "Syntax file for perl
Plugin 'https://github.com/StanAngeloff/php.vim.git'    "Syntax file for php
Plugin 'mustache/vim-mustache-handlebars'               "Syntax file for handlebars

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Enable colors
if has('unix')
  set t_Co=256
endif

" Basic coding standards
set shiftwidth=2
set tabstop=8
set expandtab
set shiftround
set smarttab

" Setup coding environment
colorscheme zenburn               
syntax enable

" Smart case and incremental search
set ignorecase
set smartcase
set incsearch
set hlsearch

" Modelines (letting files tell vim how they should be handled
set secure
set modeline

" UX/UI options
set title
set titlestring=VIM:\ %-25.55F\ %a%r%m titlelen=70
set showcmd     " Show info on the currently executing command
set confirm     " Confirmation dialog for actions that would otherwise fail
set scrolloff=5 " keep 5 lines above/below the cursor

" Status line
set laststatus=2
set statusline=
set statusline+=%<\                             "cut at start
set statusline+=%2*[%n%H%M%R%W]%*\              "flags and buf no
set statusline=%-40f                            "file path
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}]                         "file format
set statusline+=%=                              "left/right separator
set statusline+=%y\                             "filetype
set statusline+=%10((%l,%c)%)                   "line and col
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Syntastic configuration options
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Rust syntax checking options
" let g:rustfmt_autosave = 1

" PHP syntax highlighting overrides
function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END
