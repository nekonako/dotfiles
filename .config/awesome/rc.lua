
pcall(require, "luarocks.loader")

local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
require('error_handling')

-- Load theme
local conf = awful.util.getdir("config")
local current_theme = conf .."/themes/djancoeg/theme.lua"
beautiful.init(current_theme)


require("awful.autofocus")
require("awful.hotkeys_popup.keys")
require('menu')
require('bar')
require('notification')
require('dock')
require('autostart')
-- require('widget.hello')

-- Load Wallpaper
awful.screen.connect_for_each_screen(function()
gears.wallpaper.maximized("/home/nako/image/wall/sky.jpg")
end)


-- Window rules
require('rules')

-- Tag Layout
tag.connect_signal("request::default_layouts", function()
   awful.layout.append_default_layouts({
      awful.layout.suit.floating,
      awful.layout.suit.tile,
      awful.layout.suit.tile.left,
      awful.layout.suit.tile.bottom,
      awful.layout.suit.tile.top,
      awful.layout.suit.fair,
      awful.layout.suit.fair.horizontal,
      awful.layout.suit.spiral,
      awful.layout.suit.spiral.dwindle,
      awful.layout.suit.max,
      awful.layout.suit.max.fullscreen,
      awful.layout.suit.magnifier,
      awful.layout.suit.corner.nw,
   })
end)


-- Load keybinding
require('keybind')

-- titlebar
local function shapemanager(c)
  c.shape = function(cr, w, h)
    if not c.fullscreen and not c.maximized then
      gears.shape.rounded_rect(cr, w, h, beautiful.border_radius or 10)
    else
      gears.shape.rounded_rect(cr, w, h, 0)
    end
  end
end

client.connect_signal("manage", function(c)
  if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
    awful.placement.no_offscreen(c)
  end
  shapemanager(c)
end)
client.connect_signal("request::geometry", function(c) shapemanager(c) end)
client.connect_signal("request::activate", function(c) shapemanager(c) end)
client.connect_signal("request::titlebars", function(c)
  local buttons = gears.table.join(
    awful.button({},1,function()
      c:emit_signal("request::activate", "titlebar", {raise = true})
      awful.mouse.client.move(c)
    end),
    awful.button({},3,function()
      c:emit_signal("request::activate", "titlebar", {raise = true})
      awful.mouse.client.resize(c)
    end)
  )
  local title_left = {
    awful.titlebar.widget.closebutton(c),
    awful.titlebar.widget.maximizedbutton(c),
    awful.titlebar.widget.minimizebutton(c),
    layout = wibox.layout.fixed.horizontal
  }
  local title_center = {
    {
      {
        align = "center",
        widget = awful.titlebar.widget.titlewidget(c)
      },
      right = 70,
      widget = wibox.container.margin
    },
    buttons = buttons,
    layout = wibox.layout.flex.horizontal
  }
  awful.titlebar(c, {size = beautiful.titlebar_height,position = 'left'}):setup {
    {
      title_left,
      title_center,
      layout = wibox.layout.align.horizontal
    },
    left = 20,
    right = 20,
    top = 5,
    bottom = 5,
    layout = wibox.container.margin
  }
end)

