---------------------------
-- Default awesome theme --
---------------------------
local theme = {}
local gears = require("gears")
local theme_assets = require("beautiful.theme_assets")
local dpi = require("beautiful.xresources").apply_dpi
local color = require("components.color")
local gfs = require("gears.filesystem")
local themes_path = gfs.get_configuration_dir() .. "/themes/"

theme.font = "Firacode nerd font 10"

theme.bg_normal = color.background
theme.bg_focus = color.color4
theme.bg_urgent = color.color1
theme.bg_minimize = color.background
theme.bg_systray = color.background

theme.fg_normal =  color.foreground
theme.fg_focus = color.background
theme.fg_urgent = color.foreground
theme.fg_minimize = color.foreground

theme.useless_gap = dpi(10)
theme.border_width = dpi(0)
theme.border_normal = color.background
theme.border_focus = color.color4
theme.border_marked = "#91231c"
theme.border_radius = dpi(9)

theme.titlebar_height = dpi(25)
theme.wibar_height = dpi(30)
theme.wibar_corner_radius = dpi(0)

theme.titlebar_bg_focus = color.color4
theme.titlebar_bg_normal = color.background
theme.titlebar_fg_focus = color.color5

local taglist_square_size = dpi(0)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(taglist_square_size, theme.fg_normal)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(taglist_square_size, theme.fg_normal)

theme.tasklist_bg_normal = color.foreground .. "11"
theme.tasklist_bg_minimize = color.foreground .. "11"
theme.tasklist_bg_focus = color.color4
theme.tasklist_bg_urgent = color.color1

theme.menu_height = dpi(25)
theme.menu_width = dpi(120)

theme.titlebar_close_button_normal = themes_path .. "default/titlebar/close_normal.png"
theme.titlebar_close_button_focus = themes_path .. "default/titlebar/close_focus.png"
theme.titlebar_close_button_focus_hover = themes_path .. "default/titlebar/close_hover.png"
theme.titlebar_close_button_focus_active_hover = themes_path .. "default/titlebar/close_hover.png"

theme.titlebar_minimize_button_normal = themes_path .. "default/titlebar/minimize.png"
theme.titlebar_minimize_button_focus = themes_path .. "default/titlebar/minimize.png"

theme.titlebar_maximized_button_normal_inactive = themes_path .. "default/titlebar/close_hover.png"
theme.titlebar_maximized_button_focus_inactive = themes_path .. "default/titlebar/max.png"
theme.titlebar_maximized_button_normal_active = themes_path .. "default/titlebar/max.png"
theme.titlebar_maximized_button_focus_active = themes_path .. "default/titlebar/max.png"

theme.titlebar_maximized_button_normal_hover = themes_path .. "default/titlebar/close_hover.png"
theme.titlebar_maximized_button_focus_hover = themes_path .. "default/titlebar/close_hover.png"
theme.titlebar_maximized_button_focus_active_hover = themes_path .. "default/titlebar/close_hover.png"
theme.titlebar_minimize_button_focus_hover = themes_path .. "default/titlebar/close_hover.png"

theme.icon_theme = "/home/yune/.icons/oomox-shiki-brave"

theme.notification_border_width = 0
theme.notification_bg = theme.bg_normal
theme.notification_border_color = theme.bg_normal
theme.notification_width = dpi(200)
theme.notification_max_width = dpi(400)
theme.notification_shape = function(cr, w, h)
gears.shape.rounded_rect(cr, w, h, 6)
end
return theme
