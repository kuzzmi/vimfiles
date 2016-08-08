" Vim syntax file
" Language: Todo File
" Maintainer: Igor Kuzmenko
" Latest Revision: 8/8/2016

if exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'javascript'
elseif exists("b:current_syntax") && b:current_syntax == "javascript"
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn region todoAPIBody              start=/```/ end=/```/
syn match todoCheckboxUnchecked     "^\s*. \?\[ \]"
syn match todoCheckboxChecked       "^\s*. \?\[x\]"
syn match todoJIRAStoryID           "\(UNI\|PRE\)-\d\{3,\}"
syn match todoEndpointPath          "\/api\/v1\/.*"
syn match todoEndpointMethod        "\(GET\|POST\|PUT\|DELETE\) "
syn match todoKeywords              "\(Details\|Body\|Proposal\|Endpoint\):"

hi KeywordBold ctermfg=110 ctermbg=235 cterm=none guifg=#87AFD7 guibg=#262626 gui=bold
hi EndpointPath ctermfg=16 ctermbg=211 cterm=bold guibg=#262626 guifg=#FF87AF gui=none
hi EndpointMethod ctermfg=16 ctermbg=211 cterm=bold guibg=#262626 guifg=#FF87AF gui=bold

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_javascript_syn_inits")
  if version < 508
    let did_javascript_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink todoCheckboxUnchecked        Macro
  HiLink todoCheckboxChecked          Macro
  HiLink todoJIRAStoryID              KeywordBold
  HiLink todoAPIBody                  String
  HiLink todoKeywords                 Keyword
  HiLink todoEndpointMethod           EndpointMethod
  HiLink todoEndpointPath             EndpointPath
  delcommand HiLink
endif

let b:current_syntax = "todo"
if main_syntax == 'todo'
  unlet main_syntax
endif
let &cpo = s:cpo_save
unlet s:cpo_save
