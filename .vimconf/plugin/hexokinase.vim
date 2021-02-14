if exists('g:plugs["vim-hexokinase"]')
    let g:hexokinase_highlighters = [
    \ 'virtual',
    \ ]
    let g:Hexokinase_virtualText = ' '
    let g:Hexokinase_signIcon = ' '
    let g:Hexokinase_alpha_bg = '#292D3E'
    let g:Hexokinase_checkBoundary = 0
    let g:Hexokinase_optInPatterns = [
                \'full_hex',
                \'triple_hex',
                \'rgba',
                \'hsl',
                \'hsla',
                \] 
endif
