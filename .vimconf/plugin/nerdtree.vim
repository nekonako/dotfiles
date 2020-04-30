" ==============
"    NERDTREE
" ==============
if exists('g:plugs["nerdtree"]')
autocmd StdinReadPre * let S:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
let g:NERDTreeDirArrowExpandable = ""
let g:NERDTreeDirArrowCollapsible = ""
let g:NERDTreeWinSize=30
let g:NERDTreeMinimalUI = 1
let g:NERDTreeHighlightCursorline = 1
autocmd FileType nerdtree setlocal signcolumn=no
endif

