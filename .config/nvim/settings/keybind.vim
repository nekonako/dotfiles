"==================
" KEYBINDING
"==================
let mapleader=','

"BUFFER
noremap <A-j> :bp<cr>
noremap <A-k> :bn<cr>
noremap <A-L> :bl<cr>
noremap <A-H> :bf<cr>
noremap <leader>q :bp<cr>:bd #<cr>

"NVIM TREE
noremap <C-\> :NvimTreeToggle<cr>
" AUTOFORMAT
noremap <leader>f :Autoformat<CR>

"NVIM COMPE
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

