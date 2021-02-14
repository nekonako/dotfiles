" ===================
"    VIM GITGUTTER
" ===================
if exists('g:plugs["vim-gitgutter"]')
let g:gitgutter_async = 1


highlight GitGutterChange guifg= #F79F20
highlight GitGutterAdd guifg=#B8CC52
highlight GitGutterDelete guifg=#F9585D
highlight SignColumn guifg=#E6B450

let g:gitgutter_sign_allow_clobber =1
let g:gitgutter_set_sign_backgrounds = 1


let g:gitgutter_sign_added = '┃'
let g:gitgutter_sign_modified = '┃'
let g:gitgutter_sign_removed = '┃'

highlight GitGutterChangeLine guifg=#E6B450

endif

