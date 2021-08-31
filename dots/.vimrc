" Set up Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

" Vundle plugins
call vundle#begin()
Plugin 'VundleVim/Vundle.vim' " required
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'ntpeters/vim-better-whitespace'
call vundle#end()

filetype plugin indent on

" Set tab size to 2 spaces
set ai
set ts=2
set sw=2
set et

" Set familiar backspace mode
set bs=2
set backspace=indent,eol,start

" Show status bar and line numbers
set ls=2
set nu

" Enable syntax highlighting
syntax on
filetype plugin indent on

" Set filetypes
autocmd BufNewFile,BufRead Gemfile set filetype=ruby

" Ignore case when searching
set ic

" Don't wrap lines
set nowrap

" Limit syntax highlighting on long lines
set synmaxcol=200

" Configure CtrlP to use a cache
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'

" Use rg for grep and search if available
if executable('rg')
  set grepprg=rg\ --vimgrep
  let g:ctrlp_user_command = 'rg --color never --files %s'
endif
