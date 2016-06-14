" Disable compatibility mode
set nocp

" Set tab size to 2 spaces
set ai
set ts=2
set sw=2
set et

" Set familiar backspace mode
set bs=2

" Show status bar and line numbers
set ls=2
set nu

" Enable syntax highlighting
syntax on

" Set filetypes
autocmd BufNewFile,BufRead Gemfile set filetype=ruby

" Ignore case when searching
set ic
