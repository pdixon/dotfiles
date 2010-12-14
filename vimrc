filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

set nocompatible

set modelines=0

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85
set autoindent
set list
set listchars=tab:▸\ ,eol:¬
syntax enable

set showcmd
set showmode
set relativenumber
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P
set laststatus=2

set incsearch
set hlsearch
nnoremap <leader><space> :noh<cr>

set spell spelllang=en_nz

vmap Q gq
nmap Q gqap
