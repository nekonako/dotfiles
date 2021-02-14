" ===================
"    VIM GITGUTTER
" ===================
if exists('g:plugs["vim-gitgutter"]')
let g:gitgutter_async = 1


highlight GitGutterChange guifg= #E5D4AB
highlight GitGutterAdd guifg=#BFE7AF
highlight GitGutterDelete guifg=#FFA3A3
highlight SignColumn guifg=#B0AEE6

let g:gitgutter_sign_allow_clobber =1
let g:gitgutter_set_sign_backgrounds = 1


let g:gitgutter_sign_added = '┃'
let g:gitgutter_sign_modified = '┃'
let g:gitgutter_sign_removed = '┃'

highlight GitGutterChangeLine guifg=#DAAEE6

endif

