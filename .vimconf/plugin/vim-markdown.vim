" =====================
"     VIM MARKDOWN
" =====================
if exists('g:plugs["vim-markdown"]')
  let g:mkdp_auto_close                        = 0
  let g:vim_markdown_auto_insert_bullets       = 0
  let g:vim_markdown_conceal                   = 0
  let g:vim_markdown_edit_url_in               = 'tab'
  let g:vim_markdown_folding_disabled          = 1
  let g:vim_markdown_folding_level             = 6
  let g:vim_markdown_follow_anchor             = 1
  let g:vim_markdown_frontmatter               = 1
  let g:vim_markdown_frontmatter               = 1
  let g:vim_markdown_json_frontmatter          = 1
  let g:vim_markdown_json_frontmatter          = 1
  let g:vim_markdown_math                      = 1
  let g:vim_markdown_new_list_item_indent      = 2
  let g:vim_markdown_no_extensions_in_markdown = 1
  let g:vim_markdown_strikethrough             = 1
  let g:vim_markdown_toc_autofit               = 1
  let g:vim_markdown_toml_frontmatter          = 1
  let g:vim_markdown_fenced_languages          = [
        \ 'csharp = cs', 'c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini'
        \ ]
endif
