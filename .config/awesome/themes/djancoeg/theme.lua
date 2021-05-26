---------------------------
-- djancoeg awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local gears = require('gears')
local dpi = xresources.apply_dpi
local color = xresources.get_current_theme ()
local gfs = require("gears.filesystem")
local themes_path = gfs.get_configuration_dir() .. "/themes/"

local theme = {}

theme.font          = "PragmataPro liga 12"

theme.bg_normal = color.background
theme.bg_focus = color.color3
theme.bg_urgent = color.color1
theme.bg_minimize = color.background
theme.bg_systray = color.background

theme.fg_normal =  color.foreground
theme.fg_focus = color.foreground
theme.fg_urgent = color.foreground
theme.fg_minimize = color.foreground

theme.border_width = dpi(0)
theme.border_normal = color.color3
theme.border_focus = color.color4
theme.border_marked = color.color1
theme.border_radius = dpi(9)

theme.titlebar_height = dpi(27)
theme.wibar_height = dpi(27)
theme.wibar_corner_radius = dpi(0)

theme.titlebar_bg_focus = color.color3
theme.titlebar_bg_normal = color.color5
theme.titlebar_fg_normal = color.foreground
theme.titlebar_fg_focus = color.background

theme.useless_gap         = dpi(5)

-- There are other variable sets
-- overriding the djancoeg one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Generate taglist squares:
local taglist_square_size = dpi(0)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
   taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
   taglist_square_size, theme.fg_normal
)

theme.taglist_fg_empty = color.foreground
theme.taglist_bg_empty = color.background

theme.taglist_fg_occupied = color.background
theme.taglist_bg_occupied = color.color6

theme.taglist_bg_focus = color.color3
theme.taglist_fg_focus = color.background

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path.."djancoeg/submenu.png"
theme.menu_height = dpi(25)
theme.menu_width = dpi(180)

theme.menu_border_width = 0
theme.menu_border_radius = dpi(9)
theme.menu_bg_normal = color.background
theme.menu_fg_normal = color.foreground
theme.menu_bg_focus = color.color6
theme.menu_fg_focus = color.background

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
theme.bg_widget = color.background
theme.fg_widget = color.foreground

-- Define the image to load
theme.titlebar_close_button_normal = themes_path.."djancoeg/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = themes_path.."djancoeg/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = themes_path.."djancoeg/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = themes_path.."djancoeg/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = themes_path.."djancoeg/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = themes_path.."djancoeg/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = themes_path.."djancoeg/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = themes_path.."djancoeg/titlebar/ontop_focus_active.png"

-- theme.titlebar_sticky_button_normal_inactive = themes_path.."djancoeg/titlebar/sticky_normal_inactive.png"
-- theme.titlebar_sticky_button_focus_inactive  = themes_path.."djancoeg/titlebar/sticky_focus_inactive.png"
-- theme.titlebar_sticky_button_normal_active = themes_path.."djancoeg/titlebar/sticky_normal_active.png"
-- theme.titlebar_sticky_button_focus_active  = themes_path.."djancoeg/titlebar/sticky_focus_active.png"

-- theme.titlebar_floating_button_normal_inactive = themes_path.."djancoeg/titlebar/floating_normal_inactive.png"
-- theme.titlebar_floating_button_focus_inactive  = themes_path.."djancoeg/titlebar/floating_focus_inactive.png"
-- theme.titlebar_floating_button_normal_active = themes_path.."djancoeg/titlebar/floating_normal_active.png"
-- theme.titlebar_floating_button_focus_active  = themes_path.."djancoeg/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = themes_path.."djancoeg/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = themes_path.."djancoeg/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = themes_path.."djancoeg/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = themes_path.."djancoeg/titlebar/maximized_focus_active.png"


-- You can use your own layout icons like this:
theme.layout_fairh = themes_path.."djancoeg/layouts/fairhw.png"
theme.layout_fairv = themes_path.."djancoeg/layouts/fairvw.png"
theme.layout_floating  = themes_path.."djancoeg/layouts/floatingw.png"
theme.layout_magnifier = themes_path.."djancoeg/layouts/magnifierw.png"
theme.layout_max = themes_path.."djancoeg/layouts/maxw.png"
theme.layout_fullscreen = themes_path.."djancoeg/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path.."djancoeg/layouts/tilebottomw.png"
theme.layout_tileleft   = themes_path.."djancoeg/layouts/tileleftw.png"
theme.layout_tile = themes_path.."djancoeg/layouts/tilew.png"
theme.layout_tiletop = themes_path.."djancoeg/layouts/tiletopw.png"
theme.layout_spiral  = themes_path.."djancoeg/layouts/spiralw.png"
theme.layout_dwindle = themes_path.."djancoeg/layouts/dwindlew.png"
theme.layout_cornernw = themes_path.."djancoeg/layouts/cornernww.png"
theme.layout_cornerne = themes_path.."djancoeg/layouts/cornernew.png"
theme.layout_cornersw = themes_path.."djancoeg/layouts/cornersww.png"
theme.layout_cornerse = themes_path.."djancoeg/layouts/cornersew.png"

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
-- theme.icon_theme = nil

theme.notification_border_width = 0
theme.notification_bg = theme.bg_normal
theme.notification_border_color = theme.bg_normal
theme.notification_width = dpi(400)
theme.notification_max_width = dpi(600)
theme.notification_shape = function(cr, w, h)
  gears.shape.rounded_rect(cr, w, h, 6)
end


return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
