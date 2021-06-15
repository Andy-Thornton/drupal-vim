call plug#begin('~/.vim/plugged')
  Plug 'junegunn/goyo.vim'
  Plug 'scrooloose/syntastic'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'ycm-core/YouCompleteMe'
  Plug 'vim-scripts/AutoComplPop'
  Plug 'mhinz/vim-startify'
  Plug 'frazrepo/vim-rainbow'
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-rhubarb'
  Plug 'reedes/vim-pencil'
  Plug 'yegappan/taglist'
  Plug 'dense-analysis/ale'
  Plug 'ycm-core/YouCompleteMe'
  Plug 'tpope/vim-vinegar'
  Plug 'asciidoc/vim-asciidoc'
  Plug 'sheerun/vim-polyglot'  
  Plug 'jnurmine/Zenburn'
call plug#end()

filetype plugin indent on
syntax on

set nocompatible
set expandtab

set shiftwidth=4
set autoindent
set softtabstop=4
set tabstop=4
set smartindent
set textwidth=79
set expandtab
set autoindent
set showmatch
set ruler
set incsearch
set t_Co=256
set nonumber
set cursorline
let g:rainbow_active = 1


autocmd! BufNewFile * silent! 0r ~/.vim/templates/tmpl.%:e

if has("autocmd")
  augroup module
    autocmd BufRead,BufNewFile *.css set filetype=css
    autocmd BufRead,BufNewFile *.desktop set filetype=desktop
    autocmd BufRead,BufNewFile *.less set filetype=less
    autocmd BufRead,BufNewFile *.adoc set filetype=asciidoc
  augroup END

endif

" Hacking netrw
let g:netrw_liststyle = 4
let g:netrw_banner = 0
let g:netrw_altv = 1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Airlines
let g:airline_solarized_bg='dark'
let g:airline_theme='zenburn'
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1

" Startify settings
let g:startify_session_dir = '~/.vim/sessions'
let g:startify_files_number = 10
let g:startify_lists = [
  \ { 'type': 'bookmarks',  'header': ['   Bookmarks'] },
  \ { 'type': 'dir',       'header': ['   Recent files'] },
  \ { 'type': 'sessions',  'header': ['   Saved sessions'] },
  \ ]
  
let g:startify_custom_header = [ ' -------------------------[ Sarah Thornton ]-------------------------' ]
let g:startify_custom_footer = [ ' -----------[ If it’s worth doing, it’s worth automating ]-----------' ]
let g:startify_bookmarks = [{'s': '~/.local/src'}, {'p': '~/.local/src/perfume'},{'g': '~/.local/src/github-transition'}]

" Ale settings
let g:ale_sign_error = '⊳'
let g:ale_sign_warning = '⋗'
" Some fun symbols to use ⊖ ⊕ ∻ ⊙ ⊏ ⊞ ⊠ ⊧ ⊳ ⋗  
let g:ale_set_highlights = 1

let b:ale_linters = {'python': ['pylint']}

" Setup the path the ctags for code profiling
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50

" Buffer navigation
nnoremap <S-left> :bprev<CR>
nnoremap <S-right> :bnext<CR>

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END

" Distraction Free Writing
function! s:goyo_enter()
"  silent !tmux set status off
"  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set scrolloff=999
endfunction

function! s:goyo_leave()
"  silent !tmux set status on
"  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showmode
  set showcmd
  set scrolloff=5
endfunction

function! g:GoyoBefore()
  set list!
  set wrap
  set linebreak
  set nocursorcolumn
  set nonumber
  set norelativenumber
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" Handy mappings
  map <F2> :Goyo<cr>

" Theme
  set background=dark
  colorscheme nord
