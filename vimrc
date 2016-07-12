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
" FileTypes {{{
" ============
"
" Filetype specific omnifuncs
autocmd FileType css,scss setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"
" Some Markdown settings
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd FileType markdown setlocal linebreak wrap

" Set 2 spaces for HTML
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType handlebars setlocal shiftwidth=2 tabstop=2
autocmd FileType unite setlocal shiftwidth=2 tabstop=2
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
" NERDTree open if VIM's empty
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" let g:NERDTreeDirArrowExpandable = ' '
" let g:NERDTreeDirArrowCollapsible = ' '
let g:NERDTreeCopyCmd= 'cp -r'
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guifg='. a:guifg
exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'white', 'none', '#FF896A', '#151515')
call NERDTreeHighlightFile('md', 'white', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'white', 'none', '#FF896A', '#151515')
call NERDTreeHighlightFile('config', 'white', 'none', '#FF896A', '#151515')
call NERDTreeHighlightFile('conf', 'white', 'none', '#FF896A', '#151515')
call NERDTreeHighlightFile('html', 'cyan', 'none', '#FF896A', '#151515')

call NERDTreeHighlightFile('styl', 'cyan', 'none', '#00C4FF', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', '#00C4FF', '#151515')
call NERDTreeHighlightFile('scss', 'cyan', 'none', '#00C4FF', '#151515')
call NERDTreeHighlightFile('sass', 'cyan', 'none', '#00C4FF', '#151515')

call NERDTreeHighlightFile('coffee', 'Red', 'none', '#FF896A', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#FF896A', '#151515')
call NERDTreeHighlightFile('json', 'Red', 'none', '#FF896A', '#151515')

call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#151515')
set fillchars+=vert:\|
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

" Swap go to first non-blank char with go to line beginning
nnoremap ^ 0
nnoremap 0 ^
vnoremap ^ 0
vnoremap 0 ^

" Navigation by logical lines
nnoremap j gj
nnoremap gj j
nnoremap k gk
nnoremap gk k
vnoremap j gj
vnoremap gj j
vnoremap k gk
vnoremap gk k

" Remapping numbers to their symbols
inoremap ! 1
inoremap @ 2
inoremap # 3
inoremap $ 4
inoremap % 5
inoremap ^ 6
inoremap & 7
inoremap * 8
verbose inoremap ( 9
verbose inoremap ) 0
inoremap 1 !
inoremap 2 @
inoremap 3 #
inoremap 4 $
inoremap 5 %
inoremap 6 ^
inoremap 7 &
inoremap 8 *
verbose inoremap 9 (
verbose inoremap 0 )
verbose inoremap [ {
verbose inoremap ] }
verbose inoremap { [
verbose inoremap } ]

" Highlight and stay
nnoremap * *N

" Emmet.vim
let g:user_emmet_leader_key='<C-q>'

" Toggle distraction modee
" autocmd! User GoyoEnter Limelight
" autocmd! User GoyoLeave Limelight!
let g:limelight_default_coefficient = 0.8
let g:goyo_width = 80
nnoremap <silent> <leader>] :Goyo<CR>

" Highlight last inserted text
nnoremap gV `[v`]

" Spell checker toggle
nnoremap <silent> <F9> :set spell!<CR>
inoremap <silent> <F9> <Esc>:set spell!<CR>gi

" Move line up/down
nnoremap <silent> <C-J> :m .+1<CR>==
nnoremap <silent> <C-K> :m .-2<CR>==
inoremap <silent> <C-+> <Esc>:m .+1<CR>==gi
inoremap <silent> <C-=> <Esc>:m .-2<CR>==gi
vnoremap <silent> <C-+> :m '>+1<CR>gv=gv
vnoremap <silent> <C-=> :m '<-2<CR>gv=gv

" Switch between windows
nnoremap <silent> <C-K> <C-W>k
nnoremap <silent> <C-J> <C-W>j
nnoremap <silent> <C-H> <C-W>h
nnoremap <silent> <C-L> <C-W>l

" Rename current word
nnoremap <leader>d yiw:%s:<C-R>":

" Search for current word in cwd
nnoremap <silent> <F11> yiw:Ag <C-R>"<CR>

" Shortcut to enter visual block substitution
vnoremap <leader>d y<Esc>:%s:<C-R>":

" Append to end of file
nnoremap <leader>a Go

" Open a presentation with Goyo
nnoremap <silent> <leader>p :PresentingStart<CR>:Goyo<CR>

" Git commands
nnoremap <F10> :Gstatus<CR>

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
nnoremap <silent> <leader>i i<Space><Esc>r

" Remove search highlighting
nnoremap <silent> <C-n> :noh<CR>

" Create Blank Newlines and stay in Normal mode
nnoremap <silent> <leader>j o<Esc>
nnoremap <silent> <leader>k O<Esc>

" Break current line with <CR> and stay in normal mode
nnoremap <F3> i<CR><Esc><F5>

" Search mappings:
" These will make it so that going to the next one in a search
" will center on the line it's found in.
nnoremap n nzz
nnoremap N Nzz

" Swap ; and :
" Convenient.
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" Commenting blocks of code.
nnoremap <leader>c gcc

" Remove trailing spaces on F5
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Copy whole file to clipboard
nnoremap <F4> <Esc>ggVG"*y
" }}}
" Unite.vim {{{
" =========
"
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
let g:unite_source_rec_async_command = 'ag --follow --nocolor --nogroup --hidden -g ""'
" ignore node_modules and bower_components
call unite#custom#source('file_rec', 'ignore_pattern', 'node_modules/\|bower_components/')
" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
call unite#custom#profile('default', 'context', {
\   'winheight': 20,
\   'direction': 'dynamicbottom'
\ })

" Initialize Unite's global list of menus
if !exists('g:unite_source_menu_menus')
    let g:unite_source_menu_menus = {}
endif

" Create an entry for our new menu of commands
let g:unite_source_menu_menus.bookmarks = {
\    'description': 'Quick bookmarks and actions'
\ }

" Define our list of [Label, Command] pairs
let g:unite_source_menu_menus.bookmarks.command_candidates = [
\   ['PULSE/                           [folder]', 'cd $HOME/Projects/PULSE/'],
\   ['PULSE/forms                      [folder]', 'cd $HOME/Projects/PULSE/forms'],
\   ['PULSE/portal                     [folder]', 'cd $HOME/Projects/PULSE/portal'],
\   ['whubi/whubi-app/client           [folder]', 'cd $HOME/Projects/whubi/whubi-app/client'],
\   ['whubi/whubi-app/server           [folder]', 'cd $HOME/Projects/whubi/whubi-app/server'],
\   ['---------------- Folders ----------------', ''],
\   ['vimrc                              [file]', 'e $HOME/vimfiles/vimrc'],
\   ['js.snippets                        [file]', 'e $HOME/vimfiles/snippets/javascript/js.snippets'],
\   ['----------------- Files -----------------', ''],
\   ['Find in sources...              [command]', 'exe "Ag " input("pattern: ")'],
\   ['New file here...                [command]', 'exe "e %:p:h/" . input("pattern: ")'],
\   ['New file here (split)...        [command]', 'exe "split %:p:h/" .  input("pattern: ")'],
\   ['---------------- Commands ---------------', ''],
\ ]

function! s:unite_settings()
    " Enable navigation with control-j and control-k in insert mode
    imap <buffer> <C-j> <Plug>(unite_select_next_line)
    imap <buffer> <C-k> <Plug>(unite_select_previous_line)
endfunction

" Unite key mappings
nnoremap <leader>f :<C-u>Unite -auto-resize -start-insert file_rec/async file_mru<cr>
nnoremap <leader>r :<C-u>Unite -auto-resize -buffer-name=files -start-insert file_rec<cr>
nnoremap <leader>y :<C-u>Unite -buffer-name=yank    history/yank<cr>
nnoremap <leader>e :<C-u>Unite -buffer-name=buffer  buffer<cr>
nnoremap <leader>b :<C-u>Unite -start-insert menu:bookmarks <cr>
" }}}
" Colors {{{
" ======
"
" Enable 256 Colors
set t_Co=256
colorscheme bubblegum-256-dark

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
" Neocomplete {{{
" =========
"
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Trigger after 3 chars
let g:neocomplete#sources#syntax#min_keyword_length = 3
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  " return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 0
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
" let g:syntastic_check_on_wq = 0
" let g:syntastic_check_on_open = 1
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_javascript_checkers = ['eslint']

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_error_symbol = '✖'
let g:syntastic_style_error_symbol = '☠'
let g:syntastic_warning_symbol = '☸'
let g:syntastic_style_warning_symbol = '💩'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn
" }}}
" Vim-airline {{{
let g:airline_section_y = '%{strftime("%D %T")}'
set laststatus=2
let g:airline#extensions#tabline#enabled = 0
let g:airline_theme="bubblegum"
set encoding=utf-8

"
let g:airline_symbols = {}
let g:airline_left_sep = ""
let g:airline_left_alt_sep = ""
let g:airline_right_sep = ""
let g:airline_right_alt_sep = ""
let g:airline_symbols.branch = ""
let g:airline_symbols.readonly = ""
let g:airline_symbols.linenr = " "
" let g:airline_symbols = {}
" let g:airline_left_sep = ">"
" let g:airline_left_alt_sep = ">"
" let g:airline_right_sep = "<"
" let g:airline_right_alt_sep = "<"
" let g:airline_symbols.branch = "Ч"
" let g:airline_symbols.readonly = "ro"
" let g:airline_symbols.linenr = "ln"

" }}}
" Font settings {{{
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=DejaVuSansMonoForPowerline\ Nerd:h13
    set linespace=0
  endif
else
  " If using ConEmu
  if !empty($CONEMUBUILD)
    set term=pcansi
    set t_Co=256
  endif
endif
" }}}
" Misc {{{
" ====

" Speed up syntax highlighting {
   set nocursorcolumn
   set nocursorline
   syntax sync minlines=100
   syntax sync maxlines=240
   " Don't try to highlight lines longer than 900 characters,
   " in order to speed up the viewport.
   set synmaxcol=900
" }

" Disable swap files from being created
set noswapfile

" Set new directory for backup files
set nobackup

" Remove widget stuff from window in gVim
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L

" Use modelines
set modelines=1

" Automatic reloading of .vimrc
" autocmd! bufwritepost vimrc source %

" Start scrolling 7 lines before edge
set so=7

" Horizontal split always to the bottom
set splitbelow

" Puts vertical windows to right, instead of left.
set splitright

" Tabs are 4 chars wide
set tabstop=4

" Indentation size is 4 characters
set shiftwidth=4

" Make backspace work like most other apps
set backspace=2

" Dont add additional space on S-j
set nojoinspaces

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

" Highlighting trail spaces
highlight ExtraWhitespace ctermfg=red guifg=red
" ctermfg=white guifg=white
match ExtraWhitespace /\s\+$/

" TODO test
highlight MyTodo ctermbg=white ctermfg=red guibg=white guifg=red
match MyTodo /TODO.*/

" Displaying spaces as dots and EOL as ¬
set listchars=tab:▸\ ,trail:♥
set list!

" Autocompletion stuff...
" set complete=.,w,b,u,U,t,i,d
" set complete+=k
" set dictionary=./words/english,./words/russian

" Turn off bell
autocmd GUIEnter * set noerrorbells visualbell t_vb=

" Per Project configurations
set exrc
set secure
" }}}

" vim:foldmethod=marker:foldlevel=0
