set encoding=utf-8
syntax enable

set nocompatible
set noswapfile
set nowrap
set number
set incsearch                  
set ignorecase
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent                 
set smartindent                
set splitbelow
set splitright

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive.git'
Plugin 'fatih/vim-go'
Plugin 'dylanaraps/wal.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/syntastic'
Plugin 'airblade/vim-gitgutter'
Plugin 'majutsushi/tagbar'
Plugin 'mattn/emmet-vim'
Plugin 'Shougo/neosnippet.vim'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'w0rp/ale'
Plugin 'godlygeek/tabular.git'
Plugin 'junegunn/vim-easy-align'
Plugin 'morhetz/gruvbox'
Plugin 'Shougo/deoplete.nvim'
"Plugin 'Shougo/neocomplete.vim'
Plugin 'roxma/vim-hug-neovim-rpc'
Plugin 'roxma/nvim-yarp'

call vundle#end()            
filetype plugin indent on

" youcomplete
"let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

" deoplete
let g:deoplete#enable_at_startup = 1

" neoplete
"let g:neocomplete#enable_at_startup = 1

" Emmet 
let g:user_emmet_mode='a'
let g:user_emmet_leader_key='<C-Z>'

" ctrlp configuration
let g:ctrlp_map = '<c-o>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|vendor\|node_modules'
  \ }
nnoremap <C-i> :CtrlPTag<CR>

" tagbar configuration
nnoremap <C-m> :TagbarToggle<CR>

" ale configuration 
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'vue': ['eslint']
\}

" nerdtree configuration
autocmd StdinReadPre * let S:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
let g:NERDTreeDirArrowExpandable = " "
let g:NERDTreeDirArrowCollapsible = " "
map <C-n> :NERDTreeToggle<CR>

" airline
let g:airline_powerline_fonts = 1

" colorscheme
colorscheme wal

" neosnippet
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

