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
filetype plugin on
set omnifunc=syntaxcomplete#Complete
" }}}
" Line numbers {{{
" ============
"
" Enable
set number

" Display absolute numbers only for current line
autocmd InsertEnter * silent! :set number
autocmd InsertLeave,BufNewFile,VimEnter * silent! :set relativenumber
" }}}
" Explore (NERDTree) {{{
" ==============
"
" let g:netrw_list_hide= '^\..*'
" let g:netrw_hide = 1
" let g:netrw_liststyle = 3
" let g:netrw_keepdir = 0
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeCopyCmd= 'cp -r'
set fillchars+=vert:\ 
" }}}
" Leader key {{{
" ==========
"
" Has to be defined before all mappings
" Set leader key as a Space key
let mapleader = " "
" }}}
" Mappings {{{
" ========
"
" Open netrw
" nnoremap <leader>f :Explore<CR>
" Open NERDTree
nnoremap <leader>f :NERDTreeToggle<CR>

" Toggle fullscreen
if has("gui_running") && has("gui_win32")
    nnoremap <silent> <F11> :call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
    vnoremap <silent> <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
    inoremap <silent> <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
endif

" Beautify on different FileTypes
autocmd FileType javascript nnoremap <silent> == <V>:call RangeJsBeautify()<CR><Esc>
autocmd FileType html nnoremap <silent> <leader>u :call HtmlBeautify()<CR>

" Swap go to first non-blank char with go to line beginning
nnoremap ^ 0
nnoremap 0 ^

" Navigation by logical lines
nnoremap j gj
nnoremap gj j
nnoremap k gk
nnoremap gk k
vnoremap j gj
vnoremap gj j
vnoremap k gk
vnoremap gk k

" Highlight and stay
nnoremap * *N

" Change current word
nnoremap <M-1> ciw

" After pasting select pasted text
nnoremap p pV']

" Emmet.vim
let g:user_emmet_leader_key='<C-q>'

" Toggle distraction modee
" autocmd! User GoyoEnter Limelight
" autocmd! User GoyoLeave Limelight!
let g:limelight_default_coefficient = 0.8
let g:goyo_width = 120
nnoremap <silent> <leader>] :Goyo<CR>

" Highlight last inserted text
nnoremap gV `[v`]

" Spell checker toggle
nnoremap <silent> <F9> :set spell!<CR>
inoremap <silent> <F9> <Esc>:set spell!<CR>gi

" Move line up/down
nnoremap <silent> <C-+> :m .+1<CR>==
nnoremap <silent> <C-=> :m .-2<CR>==
inoremap <silent> <C-+> <Esc>:m .+1<CR>==gi
inoremap <silent> <C-=> <Esc>:m .-2<CR>==gi
vnoremap <silent> <C-+> :m '>+1<CR>gv=gv
vnoremap <silent> <C-=> :m '<-2<CR>gv=gv

" Switch between windows
nnoremap <silent> <C-K> <C-W>k
nnoremap <silent> <C-J> <C-W>j
nnoremap <silent> <C-H> <C-W>h
nnoremap <silent> <C-L> <C-W>l

" Open Project plugin
nnoremap <silent> <F2> :Project<CR>

" Rename current word
nnoremap <leader>d yiw:%s:<C-R>":

" Shortcut to enter visual block substitution
vnoremap <leader>d y<Esc>:%s:<C-R>":

" Append to end of file
nnoremap <leader>a Go

" Git commands
nnoremap <F10> :Gstatus<CR>

" TypeScript support
autocmd FileType typescript nnoremap <C-b> :make<CR>
autocmd FileType typescript inoremap <C-Space> <C-x><C-o>
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" Increment selected numbers
function! Incr()
    let a = line('.') - line("'<")
    let c = virtcol("'<")
    if a > 0
        execute 'normal! '.c.'|'.a."\<C-a>"
    endif
    normal `<
endfunction
vnoremap <C-a> :call Incr()<CR>

" Toggle folding by <Space-Z>
nnoremap <leader>z za
onoremap <leader>z <C-C>za

" Duplicate current selection
nnoremap <C-D> yyP
inoremap <C-D> <Esc>yyPi

" Indentation without losing selection
vnoremap > >gv
vnoremap < <gv

" Insert one character
nnoremap <silent> <C-i> i<Space><Esc>r

" Remove search highlighting
nnoremap <silent> <C-n> :noh<CR>

" Create Blank Newlines and stay in Normal mode
nnoremap <silent> <leader>j o<Esc>
nnoremap <silent> <leader>k O<Esc>

" Break current line with <CR> and stay in normal mode
nnoremap <F3> i<CR><Esc>

" Search mappings: These will make it so that going to the next one in a search will center on the line it's found in.  map N Nzz
nnoremap n nzz
nnoremap N Nzz

" Surround word with {{ }}. Used in Angular
nnoremap <silent> <leader>b i{{<Esc>ea}}<Esc>bb

" Swap ; and :
" Convenient.
nnoremap ; :
nnoremap : ;

" Commenting blocks of code.
nnoremap <leader>c gcc

" Remap jk to Escape in Insert mode
inoremap jk <Esc>

" Scroll buffers
nnoremap <leader>1 :bprev<CR>
nnoremap <leader>2 :bnext<CR>

" Remove trailing spaces on F5
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Copy whole file to clipboard
nnoremap <F4> <Esc>ggVG"*y
" }}}
" " Dvorak mappings {{{
" " ===============
" inoremap a a
" inoremap b x
" inoremap c j
" inoremap d e
" inoremap e .
" inoremap f u
" inoremap g i
" inoremap h d
" inoremap i c
" inoremap j h
" inoremap k t
" inoremap l n
" inoremap m m
" inoremap n b
" inoremap o r
" inoremap p l
" inoremap q '
" inoremap r p
" inoremap s o
" inoremap t y
" inoremap u g
" inoremap v k
" inoremap w ,
" inoremap x q
" inoremap y f
" inoremap z ;
" inoremap ; s
" inoremap ' -
" inoremap " _
" inoremap , w
" inoremap . v
" inoremap / z
" inoremap A A
" inoremap B X
" inoremap C J
" inoremap D E
" inoremap E >
" inoremap F U
" inoremap G I
" inoremap H D
" inoremap I C
" inoremap J H
" inoremap K T
" inoremap L N
" inoremap M M
" inoremap N B
" inoremap O R
" inoremap P L
" inoremap Q "
" inoremap R P
" " }}}
" Unite.vim {{{
" =========
"
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
" nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
nnoremap <leader>y :<C-u>Unite -buffer-name=yank    history/yank<cr>
nnoremap <leader>e :<C-u>Unite -buffer-name=buffer  buffer<cr>
" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
call unite#custom#profile('default', 'context', {
\   'winheight': 10
\ })
function! s:unite_settings()
    " Enable navigation with control-j and control-k in insert mode
    imap <buffer> <C-j>   <Plug>(unite_select_next_line)
    imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction
" }}}
" Colors {{{
" ======
"
" Enable 256 Colors
set t_Co=256

" let g:seoul256_background = 235
colorscheme shades-of-teal
" if !empty($CONEMUBUILD)
"     colorscheme lapis256
" else
" endif
" }}}
" Folding {{{
" =======
"
set foldenable
set foldlevelstart=10
set foldmethod=indent
" Adding new folding method:
" au FileType javascript call JavaScriptFold()

" }}}
" Misc {{{
" ====
"

" Disable swap files from being created
set noswapfile

" Set new directory for backup files
set nobackup

" Some Markdown settings
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd FileType markdown setlocal linebreak wrap

" Remove widget stuff from window in gVim
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L

" Use modelines
set modelines=1

" Vim-airline customization
let g:airline_section_y = '%{strftime("%D %T")}'
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme="tomorrow"
set encoding=utf-8

" Font settings
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    " set guifont=Lucida\ Console:h11
    " set guifont=Anonymice\ Powerline:h11
    set guifont=Meslo\ LG\ S\ DZ\ for\ Powerline:h11
    set linespace=0
  endif
else 
  " If using ConEmu
  if !empty($CONEMUBUILD)
    set term=pcansi
    set t_Co=256
  endif
endif

let g:airline_symbols = {}
let g:airline_left_sep = ""
let g:airline_left_alt_sep = ""
let g:airline_right_sep = ""
let g:airline_right_alt_sep = ""
let g:airline_symbols.branch = ""
let g:airline_symbols.readonly = ""
let g:airline_symbols.linenr = "ln"

" Automatic reloading of .vimrc
autocmd! bufwritepost vimrc source %

" Start scrolling 7 lines before edge
set so=7

" Tabs are 4 chars wide
set tabstop=4

" Indentation size is 4 characters
set shiftwidth=4

" Make backspace work like most other apps
set backspace=2

" Set 2 spaces for HTML
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType unite setlocal shiftwidth=2 tabstop=2

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
" set complete+=k
" set dictionary=./words/english,./words/russian
" }}}
" Neocomplete {{{
" =========
"
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 1
let g:neocomplete#use_vimproc = 0
" }}}
" Vim-go {{{
" =========
"
let g:go_disable_autoinstall = 0
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
" }}}
" Syntastic {{{
" =========
"
let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_open = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
" }}}

" Turn off bell
autocmd GUIEnter * set noerrorbells visualbell t_vb=

function! Quotereturn()
  let before=strpart(getline(line(".")), 0, col(".")-1)
  "let after=strpart(getline(line(".")), col("."))
  if(before =~ '^\([^'']*"\([^''\\]\|\\.\)*''\)*[^'']*''\([^''\\]\|\\.\)*$')
    return "\' +\'\<Left>\<CR>\<Right>"
  else
    return "\<CR>"
  endif
endf
inoremap <CR> <C-R>=Quotereturn()<CR>

" vim:foldmethod=marker:foldlevel=0
