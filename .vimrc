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
Plugin 'dylanaraps/wal.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'jiangmiao/auto-pairs'
Plugin 'altercation/vim-colors-solarized'
"Plugin 'vim-colorschemes'
Plugin 'majutsushi/tagbar'
Plugin 'morhetz/gruvbox'
Plugin 'Shougo/deoplete.nvim'
Plugin 'roxma/vim-hug-neovim-rpc'
Plugin 'roxma/nvim-yarp'

call vundle#end()            
filetype plugin indent on

" deoplete
let g:deoplete#enable_at_startup = 1

" ctrlp configuration
let g:ctrlp_map = '<c-o>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|vendor\|node_modules'
  \ }
nnoremap <C-i> :CtrlPTag<CR>

" tagbar configuration
nnoremap <C-m> :TagbarToggle<CR>

" nerdtree configuration
autocmd StdinReadPre * let S:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
let g:NERDTreeDirArrowExpandable = " "
let g:NERDTreeDirArrowCollapsible = " "
map <C-n> :NERDTreeToggle<CR>

" airline
let g:airline_powerline_fonts = 1
"let g:airline_theme='solarized'
"let g:airline_theme='gruvbox'

" colorscheme
colorscheme wal
"colorscheme gruvbox
"colorscheme solarized
set background=dark

" neosnippet
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

