" ============
"    TAGBAR
" ============
if exists('g:plugs["tagbar"]')
  let g:tagbar_autopreview      = 0
  let g:tagbar_indent           = 1
  let g:tagbar_show_linenumbers = 1
  let g:tagbar_show_visibility  = 1
  let g:tagbar_singleclick      = 1
  let g:tagbar_sort             = 1
  let g:tagbar_width = 35
  let g:airline#extensions#tagbar#enabled = 1
nnoremap <C-m> :TagbarToggle<CR>
endif
