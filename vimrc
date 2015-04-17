""""""""""
" kuzzmi .vimrc
"
""""""""""
" Pathogen {{{
" ========
"
" Enable
execute pathogen#infect()
" }}}
" Syntax highlighting {{{
syntax on
filetype plugin indent on
" }}}
" Line numbers {{{
" ============
"
" Enable
set number

" Display absolute numbers only in Insert mode
autocmd InsertEnter * silent! :set number
autocmd InsertLeave,BufNewFile,VimEnter * silent! :set relativenumber
" }}}
" Explore (Nerw) {{{
" ==============
"
let g:netrw_list_hide= '^\..*'
let g:netrw_hide = 1
let g:netrw_liststyle = 3
" let g:netrw_keepdir = 0
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | Explore | endif
" }}}
" Leader key {{{
" ==========
"
" Has to be defined before all mappings
" Set leader key as a ,
let mapleader = " "
" }}}
" Mappings {{{
" ========
"
" Open netrw
nnoremap <leader>f <C-w>v<Esc>:Explore<CR>

" Swap go to first non-blank char with go to line beginning
nnoremap ^ 0
nnoremap 0 ^

" highlight last inserted text
nnoremap gV `[v`]

" Move line up/down
nnoremap <silent> <C-J> :m .+1<CR>==
nnoremap <silent> <C-K> :m .-2<CR>==
inoremap <silent> <C-J> <Esc>:m .+1<CR>==gi
inoremap <silent> <C-K> <Esc>:m .-2<CR>==gi
vnoremap <silent> <C-J> :m '>+1<CR>gv=gv
vnoremap <silent> <C-K> :m '<-2<CR>gv=gv

nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-l> <C-w>l

" Open Project plugin
nnoremap <silent> <F2> :Project<CR>

" Append to end of file
nnoremap <C-A> Go

" Toggle folding by space
nnoremap <leader>z za
onoremap <leader>z <C-C>za

" Duplicate current selection
nnoremap <C-D> yyP
inoremap <C-D> <Esc>yyPi

" Indentation without losing selection
vnoremap > >gv
vnoremap < <gv

" Remove search highlighting
nnoremap <silent> <C-n> :noh<CR>

" Create Blank Newlines and stay in Normal mode
nnoremap <silent> zj o<Esc>
nnoremap <silent> zk O<Esc>

" Break current line with <CR> and stay in normal mode
nnoremap <F3> i<CR><Esc>

" Search mappings: These will make it so that going to the next one in a search will center on the line it's found in.  map N Nzz
nnoremap n nzz
nnoremap N Nzz

" Swap ; and :
" Convenient.
nnoremap ; :
nnoremap : ;

" Commenting blocks of code.
autocmd FileType c,cpp,java,scala,javascript     let b:comment_leader = '// '
autocmd FileType sh,ruby,python,coffee           let b:comment_leader = '# '
autocmd FileType conf,fstab                      let b:comment_leader = '# '
autocmd FileType tex                             let b:comment_leader = '% '
autocmd FileType mail                            let b:comment_leader = '> '
autocmd FileType vim                             let b:comment_leader = '" '
noremap <silent> <leader>cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> <leader>cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

" Remap jj to Escape in Insert mode
inoremap jj <Esc>

" Remove trailing spaces on F5
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Copy whole file to clipboard
nnoremap <F4> <Esc>ggVG"*y
" }}}
" Unite.vim {{{
" =========
"
nnoremap <Space>/ :Unite grep:.<cr>
nnoremap <C-p> :Unite file_rec/async<cr>
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#custom#profile('default', 'context', {
\   'start_insert': 1,
\   'winheight': 10
\ })
" }}}
" Colors {{{
" ======
"
" Enable 256 Colors
set t_Co=256
" set cul
hi CursorLineNr  cterm=bold ctermfg=Yellow
hi CursorLine    cterm=none ctermbg=1
hi LineNr        cterm=none ctermfg=2
hi Comment       cterm=none ctermfg=3
hi Search        cterm=none ctermbg=1 ctermfg=Yellow
hi Visual        cterm=none ctermbg=1
hi Statement                ctermfg=15
hi Folded                   ctermbg=1
" }}}
" Folding {{{
" =======
"
set foldenable
set foldlevelstart=10
set foldmethod=indent
" }}}
" Misc {{{
" ====
"

" Use modelines
set modelines=1

" Vim-airline customization
let g:airline_section_y = '%{strftime("%D %T")}'
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" Use powerline fonts only for non-Windows machine
if has("win32") || has("win16")
    let g:airline_powerline_fonts = 0
endif

" Automatic reloading of .vimrc
autocmd! bufwritepost vimrc source %

" Start scrolling 5 lines before edge
set so=7

" Tabs are 4 chars wide
set tabstop=4

" Indentation size is 4 characters
set shiftwidth=4

" Set 2 spaces for HTML
autocmd FileType html setlocal shiftwidth=2 tabstop=2

" Convert tabs to spaces
set expandtab
set smarttab

" Be single lined
set nowrap

" Necesary for lots of cool vim things
set nocompatible

" This shows what you are typing as a command
set showcmd

" Who doesn't like autoindent?
set autoindent

" Cool tab completion stuff
set wildmenu
set wildmode=list:longest,full

" Ignoring case is a fun trick
set ignorecase

" And so is Artificial Intellegence!
set smartcase

" Incremental searching is sexy
set incsearch

" Highlight things that we find with the search
set hlsearch

" Don't redraw when not needed
set lazyredraw

" Autocompletion stuff...
set complete=.,w,b,u,U,t,i,d
" set dictionary=./words/english
" set dictionary+=./words/russian
set complete+=k

" Syntastic {{{
" =========
"
let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_open = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
" }}}

" vim:foldmethod=marker:foldlevel=0