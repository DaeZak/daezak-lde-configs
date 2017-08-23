" Enable vim fanciness
set nocompatible
filetype off " required for Vundle
syntax off " required for Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'git://github.com/tomtom/tplugin_vim.git'        "General plugin mgmt component

Plugin 'https://github.com/StanAngeloff/php.vim.git'    "Syntax file for php
Plugin 'https://github.com/rust-lang/rust.vim.git'      "Syntax file for rust
Plugin 'vim-perl/vim-perl'                              "Syntax file for perl
Plugin 'mustache/vim-mustache-handlebars'               "Syntax file for handlebars

Plugin 'vim-airline/vim-airline'                        "Enhanced status bar
Plugin 'vim-airline/vim-airline-themes'                 "status bar themes

Plugin 'https://github.com/ctrlpvim/ctrlp.vim.git'      "CtrlP file search for vim
Plugin 'https://github.com/vim-syntastic/syntastic.git' "Syntastic syntax checking

Plugin 'SirVer/ultisnips'                               " Track the engine.
Plugin 'honza/vim-snippets'                             " Snippets are separate from the engine

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
syntax on

" Setup theme, styling and workflow
" ----------------------------------
" Enable colors
if has('unix')
  set t_Co=256
endif

colorscheme zenburn
let g:airline_theme='angr'

" Enable airline tablines
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline_powerline_fonts = 1

" Setup coding environment and standards
" --------------------------------------
" Basic coding standards
set shiftwidth=2
set tabstop=8
set expandtab
set shiftround
set smarttab

" Smart case and incremental search
set ignorecase
set smartcase
set incsearch
set hlsearch

" Modelines (letting files tell vim how they should be handled
set secure
set modeline

" UX/UI options
set showcmd     " Show info on the currently executing command
set confirm     " Confirmation dialog for actions that would otherwise fail
set scrolloff=5 " keep 5 lines above/below the cursor

" Status line
set laststatus=2

" UltiSnips - Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<s-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Syntastic configuration options
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Rust syntax checking options
" let g:rustfmt_autosave = 1

" let g:php_syntax_extensions_enabled = 1

" PHP syntax highlighting overrides
function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

" Hotkeys, general
" ---------------------------
" Switch buffers with hotkeys
set switchbuf=usetab
nnoremap <F8> :sbnext<CR>
nnoremap <C-F8> :sbprevious<CR>
