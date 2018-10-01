call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on

set nocompatible
set expandtab

set shiftwidth=2
set autoindent
set smartindent
set showmatch
set ruler
set incsearch
set t_Co=256
set nonumber

autocmd! BufNewFile * silent! 0r ~/.vim/templates/tmpl.%:e

" Using vim with Drupal http://drupal.org/node/29325
let g:syntastic_php_phpcs_args="--standard=Drupal --extensions=php,module,inc,install,test,profile,theme"
if has("autocmd")
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
    autocmd BufRead,BufNewFile *.info set filetype=php
    autocmd BufRead,BufNewFile *.css set filetype=css
    autocmd BufRead,BufNewFile *.desktop set filetype=desktop
    autocmd BufRead,BufNewFile *.less set filetype=less
    autocmd BufRead,BufNewFile *.adoc set filetype=asciidoc
  augroup END

endif

if has('statusline')
  set laststatus=2
  set statusline=%<%f\ " Filename
  set statusline+=%w%h%m%r " Options
  set statusline+=%{fugitive#statusline()} " Git Hotness
  set statusline+=\ [%{&ff}/%Y] " filetype
  set statusline+=\ [%{getcwd()}] " current dir
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
  let g:syntastic_enable_signs=1
  set statusline+=%=%-14.(%l,%c%V%)\ %p%% " Right aligned file nav info
endif

" Setup the path the ctags for code profiling
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50

" Buffer navigation
nnoremap <S-left> :bprev<CR>
nnoremap <S-right> :bnext<CR>

" Wordprocessing mode
func! WordProcessorMode() 
  setlocal formatoptions=1 
  setlocal noexpandtab 
  map j gj 
  map k gk
  setlocal spell spelllang=en_us 
  set thesaurus+=/Users/sbrown/.vim/thesaurus/mthesaur.txt
  set complete+=s
  set formatprg=par
  setlocal wrap 
  setlocal linebreak 
endfu 
com! WP call WordProcessorMode()

" Airline plugin
let g:airline#extensions#tabline#enabled = 1      
let g:airline#extensions#tabline#left_sep = ''    
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_theme='zenburn'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
" let g:airline_symbols.readonly = ''
let g:airline_powerline_fonts=0
let g:airline#extensions#branch#enabled=1

" Handy mappings
map <F2> :NERDTreeToggle<CR>
map <F3> :TlistToggle<cr>

set background=dark
colors zenburn
let g:zenburn_force_dark_Background = 1
let g:zenburn_high_Contrast=1
syn on
