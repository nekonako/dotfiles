pcall(require, "luarocks.loader")
local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
-- register naughty error reporter
require("components.reporter")

-- setup global(rc) variables for later usage
conf = {
  aw_root = awful.util.getdir("config"),
  app = {
    editor = "st -e nvim",
    term = "st",
    filemanager = "thunar",
    music = "st -e ncmpcpp",
    launcher = "rofi -show drun",
    screenshot = "skrinsut",
    logout = "clearine",
    browser = "firefox",
    launcher = "rofi -show drun"
  }
}

-- invoke xdg autostart ()
if not conf.awesome_started then
  awful.spawn("dex --autostart --environment Awesome", false)
  conf.awesome_started = true
end

-- initialize theme system and pywal
local pywal = require("components.color")
local current_theme = conf.aw_root.."/themes/default/theme.lua"
beautiful.init(current_theme)

local bindings = require("components.bindings")
local menuschema = require("components.menuschema")
local panel = require("components.panel")

-- setup menu with menuschema
conf.menu = awful.menu(menuschema)

-- setup window rules and layouts
awful.rules.rules = require("components.windowrules")
awful.layout.layouts = {
  awful.layout.suit.floating,
  awful.layout.suit.tile,
  awful.layout.suit.tile.left,
  awful.layout.suit.tile.bottom,
  awful.layout.suit.tile.top,
  awful.layout.suit.fair,
  awful.layout.suit.fair.horizontal,
  awful.layout.suit.max.fullscreen,
  awful.layout.suit.max,
}

-- register hotkeys and mouse
root.keys(bindings.keys)
root.buttons(bindings.mouse)

-- set waallpaper
awful.screen.connect_for_each_screen(function()
gears.wallpaper.maximized("/home/yune/Pictures/Screenshot_2020-09-24-06-14-25-586_com.vanced.android.youtube.jpg")
end)

-- register client signals
require("components.clientsignal")

-- Autostart app
do
  local cmds = {
    "redshift",
    "compton",
    "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1",
    "mpd",
  }

  for _,i in pairs(cmds) do
    awful.spawn.with_shell(i .. "&")
  end
end
