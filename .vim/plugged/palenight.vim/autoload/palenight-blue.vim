let s:overrides = get(g:, "palenight_color_overrides", {})

" white_mask_<number>: Color of a white mask overlayed on top of
" `s:colors.black`, where `number * 12` is the alpha value of the white mask

let s:colors = {
            \ "red": get(s:overrides, "red", { "gui": "#fb749f", "cterm": "204", "cterm16": "1" }),
            \ "light_red": get(s:overrides, "light_red", { "gui": "#F28FAF", "cterm": "204", "cterm16": "1" }),
            \ "dark_red": get(s:overrides, "dark_red", { "gui": "#D15D83", "cterm": "196", "cterm16": "9" }),
            \ "green": get(s:overrides, "green", { "gui": "#E2CD84", "cterm": "114", "cterm16": "2" }),
            \ "yellow": get(s:overrides, "yellow", { "gui": "#86D387", "cterm": "180", "cterm16": "3" }),
            \ "dark_yellow": get(s:overrides, "dark_yellow", { "gui": "#FBB174", "cterm": "173", "cterm16": "11" }),
            \ "blue": get(s:overrides, "blue", { "gui": "#8e96fd", "cterm": "39", "cterm16": "4" }),
            \ "purple": get(s:overrides, "purple", { "gui":  "#d685ff", "cterm": "170", "cterm16": "5" }),
            \ "blue_purple": get(s:overrides, "blue_purple", { "gui": "#BEAFE7", "cterm": "39", "cterm16": "4"}),
            \ "cyan": get(s:overrides, "cyan", { "gui": "#78B4CA", "cterm": "38", "cterm16": "6" }),
            \ "white": get(s:overrides, "white", { "gui": "#F4EDFF", "cterm": "145", "cterm16": "7" }),
            \ "black": get(s:overrides, "black", { "gui": "#291E4E", "cterm": "235", "cterm16": "0" }),
            \ "visual_black": get(s:overrides, "visual_black", { "gui": "NONE", "cterm": "NONE", "cterm16": "0" }),
            \ "comment_grey": get(s:overrides, "comment_grey", { "gui": "#685D8F", "cterm": "59", "cterm16": "15" }),
            \ "gutter_fg_grey": get(s:overrides, "gutter_fg_grey", { "gui": "#8F89B7", "cterm": "238", "cterm16": "15" }),
            \ "cursor_grey": get(s:overrides, "cursor_grey", { "gui": "#35295D", "cterm": "236", "cterm16": "8" }),
            \ "visual_grey": get(s:overrides, "visual_grey", { "gui": "#463366", "cterm": "237", "cterm16": "15" }),
            \ "menu_grey": get(s:overrides, "menu_grey", { "gui": "#463366", "cterm": "237", "cterm16": "8" }),
            \ "special_grey": get(s:overrides, "special_grey", { "gui": "#8F89B7", "cterm": "238", "cterm16": "15" }),
            \ "vertsplit": get(s:overrides, "vertsplit", { "gui": "#8F89B7", "cterm": "59", "cterm16": "15" }),
            \ "white_mask_1": get(s:overrides, "white_mask_1", { "gui": "#B4B4BF", "cterm": "237", "cterm16": "15" }),
            \ "white_mask_3": get(s:overrides, "white_mask_3", { "gui": "#B4B4BF", "cterm": "238", "cterm16": "15" }),
            \ "white_mask_11": get(s:overrides, "white_mask_11", { "gui": "#B4B4BF", "cterm": "238", "cterm16": "15" })
            \}

function! palenight#GetColors()
    return s:colors
    black:   '#301e4e'
    red:     '#FEA2A2'
    green:   '#BEE6AE'
    yellow:  '#E4D3AA'
    blue:    '#B0AEE6'
    magenta: '#DAAEE6'
    cyan:    '#AFC9E7'
    white:   '#ffffff'
endfunction
