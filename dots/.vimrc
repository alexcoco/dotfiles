" vim-plug: Install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

" vim-plug: Install missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Vim Plug plugins
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'rust-lang/rust.vim'
Plug 'ntpeters/vim-better-whitespace'
call plug#end()

" fzf: set up ctrl-p binding
nnoremap <silent> <C-p> :FZF<CR>

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
set nu rnu

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
