match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$' 
autocmd filetype scss,sass,css setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType html,jinja2.html setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType javascript,jst,ezt setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType javascript.jsx set syntax=javascript
autocmd FileType markdown setlocal expandtab shiftwidth=2 softtabstop=2 colorcolumn=135  conceallevel=0
autocmd FileType php setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4 colorcolumn=135
autocmd FileType json setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType json syntax match Comment +\/\/.\+$+
autocmd FileType gitcommit setlocal colorcolumn=80 textwidth=80 fo+=t fo-=l
autocmd FileType lua setlocal expandtab shiftwidth=2 softtabstop=2
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
