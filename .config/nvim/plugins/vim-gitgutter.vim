" ===================
"    VIM GITGUTTER
" ===================
if exists('g:plugs["vim-gitgutter"]')
   let g:gitgutter_async = 1
   " highlight GitGutterChange guifg=#BEE6AE
   " highlight GitGutterAdd guifg=#BEE6AE
   " highlight GitGutterDelete guifg=#FEA2A2
   " highlight SignColumn guifg=#E4D3AA
   let g:gitgutter_sign_allow_clobber =1
   let g:gitgutter_set_sign_backgrounds = 1
   let g:gitgutter_sign_added = '┃'
   let g:gitgutter_sign_modified = '┃'
   let g:gitgutter_sign_removed = '┃'
   " highlight GitGutterChangeLine guifg=#E4D3AA
endif

