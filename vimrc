call plug#begin('~/.vim/plugged')
  Plug 'junegunn/goyo.vim'
  Plug 'scrooloose/syntastic'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'mhinz/vim-startify'
  Plug 'frazrepo/vim-rainbow'
  Plug 'airblade/vim-gitgutter'
  Plug 'reedes/vim-pencil'
  Plug 'yegappan/taglist'
  Plug 'dense-analysis/ale'
  Plug 'asciidoc/vim-asciidoc'
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

" Startify settings
let g:startify_session_dir = '~/.vim/sessions'
let g:startify_files_number = 10
" Simplify the startify list to just recent files and sessions
let g:startify_lists = [
  \ { 'type': 'bookmarks',  'header': ['   Bookmarks'] },
  \ { 'type': 'dir',       'header': ['   Recent files'] },
  \ { 'type': 'sessions',  'header': ['   Saved sessions'] },
  \ ]
  
let g:startify_custom_header = [ ' -------------------------[ Sarah Thornton ]-------------------------' ]
let g:startify_custom_footer = [ ' -----------[ If it’s worth doing, it’s worth automating ]-----------' ]
let g:startify_bookmarks = [{'s': '~/.local/src'}, {'d': '~/.local/src/documentation-and-content'}, {'g': '~/.local/src/gdpr-automation'}]

" Python settings
let g:ale_sign_error = '●'
let g:ale_sign_warning = '»'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let b:ale_linters = {'python': ['pylint']}

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
  setlocal spell spelllang=en_gb
  set thesaurus+=~/.vim/thesaurus/mthesaur.txt
  set complete+=s
  set formatprg=par
  setlocal wrap
  setlocal linebreak
endfu
com! WP call WordProcessorMode()

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

set background=dark
colors zenburn
let g:zenburn_force_dark_Background = 1
let g:zenburn_high_Contrast=1
syn on
