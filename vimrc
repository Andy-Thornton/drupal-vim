call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on

set nocompatible
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set showmatch
set ruler
set incsearch
set t_Co=256

" set number

autocmd! BufNewFile * silent! 0r ~/.vim/templates/tmpl.%:e

" Using vim with Drupal http://drupal.org/node/29325

if has("autocmd")
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
    autocmd BufRead,BufNewFile *.info set filetype=php
    autocmd BufRead,BufNewFile *.css set filetype=css
    autocmd BufRead,BufNewFile *.desktop set filetype=desktop
    autocmd BufRead,BufNewFile *.less set filetype=less
    autocmd BufWritePost *.less exe '!lessc ' . shellescape(expand('<afile>')) . ' > ' . shellescape(expand('<afile>:r')) . '.css'
  augroup END
endif

" Setup the path the ctags for code profiling
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50

map <F2> :NERDTreeToggle<CR>
map <F3> :TlistToggle<cr>

set background=dark
colors zenburn
let g:zenburn_force_dark_Background = 1
let g:zenburn_high_Contrast=1
syn on
