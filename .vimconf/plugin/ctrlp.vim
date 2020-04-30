" ==================
"       CTRLP
" ==================
if exists('g:plugs["ctrlp.vim"]')
let g:ctrlp_map = '<c-o>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|vendor\|node_modules'
  \ }
nnoremap <C-i> :CtrlPTag<CR>
endif
