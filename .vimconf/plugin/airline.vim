" ==============
"    AIRLINE
" ==============
if exists('g:plugs["vim-airline"]')
  let g:airline_powerline_fonts = 1
  let airline#extensions#coc#error_symbol       = 'E:'
  let airline#extensions#coc#stl_format_err     = '%E{[%e(#%fe)]}'
  let airline#extensions#coc#stl_format_warn    = '%W{[%w(#%fw)]}'
  let airline#extensions#coc#warning_symbol     = 'W:'
  let g:airline#extensions#branch#enabled       = 1
  let g:airline#extensions#branch#vcs_priority  = ['git', 'mercurial']
  let g:airline#extensions#coc#enabled          = 1
  let g:airline#extensions#cursormode#enabled   = 1
  let g:airline#extensions#tabline#enabled      = 1
  let g:airline#extensions#tabline#formatter    = 'unique_tail_improved'
  let g:airline#extensions#tabline#buffers_label = 'MEGUMIN'
  let g:airline_extensions                      = ['branch', 'tabline', 'coc', 'virtualenv', 'tagbar', 'fugitiveline']
  call airline#parts#define_accent('mode', 'none')
  call airline#parts#define_accent('linenr', 'none')
  call airline#parts#define_raw('linenr', '%l')
  call airline#parts#define_accent('linenr', 'none')
  let g:airline_section_z = airline#section#create(['%3p%%  ',
                \ g:airline_symbols.linenr .' ', 'linenr', ':%c'])
  " Vim-Airline-Theme
let g:airline_theme = 'dracula'

" Patching for middle section status line Terminal color
let s:saved_theme = []
let g:airline_theme_patch_func = 'AirlineThemePatch'
function! AirlineThemePatch(palette)
  for colors in values(a:palette)
    if has_key(colors, 'airline_c') && len(s:saved_theme) ==# 0
      let s:saved_theme = colors.airline_c
    endif
    if has_key(colors, 'airline_term')
      let colors.airline_term = s:saved_theme
    endif
  endfor
endfunction
endif
