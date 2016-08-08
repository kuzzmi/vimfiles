set wrap
set linebreak

nnoremap go :call OpenJira()<CR>

fun! OpenJira()
    let wordUnderCursor = expand("<cWORD>")
    let jiraRoot = "https://nvs-unify.atlassian.net/browse/"
    let url = jiraRoot . wordUnderCursor
    exec 'silent !explorer ' . url
endfun
