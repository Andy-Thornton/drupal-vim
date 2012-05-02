set nocompatible
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set showmatch
set ruler
set incsearch

autocmd! BufNewFile * silent! 0r ~/.vim/templates/tmpl.%:e
filetype on

" Using vim with Drupal http://drupal.org/node/29325

if has("autocmd")
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
    autocmd BufRead,BufNewFile *.info set filetype=php
    autocmd BufRead,BufNewFile *.css set filetype=css
    autocmd BufRead,BufNewFile *.desktop set filetype=desktop
  augroup END
endif
syntax on

map <F2> :NERDTreeToggle<CR>
map <F3> :TlistToggle<cr>

let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50
