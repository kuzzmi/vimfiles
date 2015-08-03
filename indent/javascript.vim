" vim indent file
" language:	javascript
" maintainer:	none!  wanna improve this?
" last change:	2007 jan 22

" only load this indent file when no other was loaded.
if exists("b:did_indent")
   finish
endif
let b:did_indent = 1

" c indenting is not too bad.
setlocal cindent
setlocal cinoptions+=j1,j1

let b:undo_indent = "setl cin<"
