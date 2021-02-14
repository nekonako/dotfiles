let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:p_vertsplit = ["#CDC8BB", 59, 15]
let s:p_special_grey = ["#CDC8BB", 238, 15]
let s:p_menu_grey = ["#CDC8BB", 237, 8]
let s:p_cursor_grey = ["#CDC8BB", 236, 8]
let s:p_gutter_fg_grey = ["#CDC8BB", 238, 15]
let s:p_blue = ["#AEAABD", 39, 4]
let s:p_dark_red = ["#FF6255", 196, 9]
let s:p_white = ["#777777", 145, 7]
let s:p_green = ["#A9B5A0", 114, 2]
let s:p_purple = ["#AFA0B1", 170, 5]
let s:p_yellow = ["#ffcb6b", 180, 3]
let s:p_light_red = ["#ff869a", 204, 1]
let s:p_red = ["#C499A3", 204, 1]
let s:p_dark_yellow = ["#F78C6C", 173, 11]
let s:p_cyan = ["#89DDFF", 38, 6]
let s:p_comment_grey = ["#697098", 59, 15]
let s:p_black = ["#DDD9CD", 235, 0]

let s:p.normal.left     = [ [ s:p_black, s:p_purple ], [ s:p_black, s:p_blue ] ]
let s:p.normal.right    = copy(s:p.normal.left)
let s:p.normal.middle   = [ [ s:p_white, s:p_black ] ]
let s:p.normal.warning  = [ [ s:p_black, s:p_yellow ] ]
let s:p.normal.error    = [ [ s:p_black, s:p_red ] ]

let s:p.insert.left     = [ [ s:p_black, s:p_blue ], [ s:p_black, s:p_purple ] ]
let s:p.insert.right    = copy(s:p.insert.left)
let s:p.insert.middle   = copy(s:p.normal.middle)

let s:p.visual.left     = [ [ s:p_black, s:p_purple ], [ s:p_purple, s:p_menu_grey ] ]
let s:p.visual.right    = copy(s:p.visual.left)
let s:p.visual.middle   = copy(s:p.normal.middle)

let s:p.replace.left    = [ [ s:p_black, s:p_green ], [ s:p_green, s:p_menu_grey ] ]
let s:p.replace.right   = copy(s:p.replace.left)
let s:p.replace.middle  = copy(s:p.normal.middle)

let s:p.tabline.left    = [ [ s:p_black, s:p_blue ] ]
let s:p.tabline.right   = [ [ s:p_black, s:p_purple ] ]
let s:p.tabline.middle  = [ [ s:p_yellow, s:p_black ] ]
let s:p.tabline.tabsel  = copy(s:p.tabline.right)

let s:p.inactive.left   = [ [ s:p_black, s:p_black ], [ s:p_black, s:p_black ] ]
let s:p.inactive.right  = copy(s:p.inactive.left)
let s:p.inactive.middle = [ [ s:p_black, s:p_black ] ]

let g:lightline#colorscheme#palenight#palette = lightline#colorscheme#flatten(s:p)
