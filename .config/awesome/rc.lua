pcall(require, "luarocks.loader")

local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
local theme = require('theme')
require("awful.autofocus")
require("awful.hotkeys_popup.keys")

local home = os.getenv('HOME')
-- Load theme
local current_theme = home .. '/.config/awesome/themes/' .. theme .. '/theme.lua'
beautiful.init(current_theme)

-- Load Wallpaper
awful.screen.connect_for_each_screen(function()
     gears.wallpaper.maximized(home .. '/image/wall/dais.png')
end)

-- components
require('components.' .. theme .. '.tag')
require('components.' .. theme .. '.panel')
require('components.' .. theme .. '.menu')
require('components.' .. theme .. '.titlebar')

-- utils
require('utils.autostart')
-- require('utils.layout')
require('utils.rules')
require('utils.notification')
require('utils.keybind')
require('utils.error_handling')

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
   c:activate { context = "mouse_enter", raise = false }
end)

