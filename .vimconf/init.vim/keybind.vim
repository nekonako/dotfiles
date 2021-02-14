"" Keybindings

"" Leader
let mapleader=','

"" Buffers {{{
noremap <A-j> :bp<cr>
noremap <A-k> :bn<cr>
noremap <A-L> :bl<cr>
noremap <A-H> :bf<cr>

" close buffer
noremap <leader>q :bp<cr>:bd #<cr>

" Nerd Tree
nnoremap <C-\> :NERDTreeToggle<CR>
