" =================
"    INDENT LINE
" =================
if exists('g:plugs["indentLine"]')
  let g:indentLine_char            = '┃'
  let g:indentLine_faster          = 1
  let g:indentLine_color_term = 4
  let g:indentLine_color_gui = '#212534'
  let g:indentLine_conceallevel = 2
  let g:indentLine_fileTypeExclude = [
        \ 'help', 'nerdtree', 'startify', 'Preview','__doc__', 'peekaboo',
        \ 'man', 'trans', 'fzf', 'markdown', 'json',
        \ ]
  let g:indentLine_bufTypeExclude = [
        \ 'help', 'terminal' 
        \ ]
endif
" }}}

