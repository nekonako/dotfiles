pcall(require, "luarocks.loader")

local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
require("awful.autofocus")
require("awful.hotkeys_popup.keys")
require('utils.error_handling')


local home = os.getenv('HOME')
-- Load theme
local current_theme = home .. '/.config/awesome/themes/djancoeg/theme.lua'
beautiful.init(current_theme)

-- Load Wallpaper
awful.screen.connect_for_each_screen(function()
   gears.wallpaper.maximized(home .. '/image/wall/classic-keyboard.jpg')
end)

-- utils
require('utils.notification')
require('utils.autostart')
require('utils.layout')
require('utils.keybind')
require('utils.rules')

-- components
require('components.djancoeg.dock')
require('components.djancoeg.menu')
require('components.djancoeg.bar')
require('components.djancoeg.titlebar')

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
   c:activate { context = "mouse_enter", raise = false }
end)

