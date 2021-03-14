
pcall(require, "luarocks.loader")

local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
require('utils.error_handling')

local home = os.getenv('HOME')


-- Load theme
local current_theme = home .. '/.config/awesome/themes/djancoeg/theme.lua'
beautiful.init(current_theme)

require("awful.autofocus")
require("awful.hotkeys_popup.keys")

-- utils
require('utils.notification')
require('utils.autostart')

-- components
require('components.djancoeg.dock')
require('components.djancoeg.menu')
require('components.djancoeg.bar')


-- Load Wallpaper
awful.screen.connect_for_each_screen(function()
   gears.wallpaper.maximized(home .. '/image/wall/classic-keyboard.jpg')
end)

awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.floating,
    awful.layout.suit.max,
    --awful.layout.suit.spiral,
    --awful.layout.suit.spiral.dwindle,
    --awful.layout.suit.tile.top,
    --awful.layout.suit.fair,
    --awful.layout.suit.fair.horizontal,
    --awful.layout.suit.tile.left,
    --awful.layout.suit.tile.bottom,
    --awful.layout.suit.max.fullscreen,
    --awful.layout.suit.corner.nw,
    --awful.layout.suit.magnifier,
    --awful.layout.suit.corner.ne,
    --awful.layout.suit.corner.sw,
    --awful.layout.suit.corner.se,
}

-- Tag Layout
tag.connect_signal('request::default_layouts', function()
   local l = awful.layout.suit -- Alias to save time :)
   awful.layout.append_default_layouts({
      l.max,
      l.max,
      l.max,
      l.max,
      l.tile,
      l.max,
      l.max,
      l.max,
      l.tile,
      l.max
   })
end)

-- Load keybinding
require('utils.keybind')

-- Window rules
require('utils.rules')

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

   local SP = wibox.widget {
      widget = wibox.widget.separator,
      forced_width = 10,
      opacity = 0
   }
   local titlebar_button = {
      awful.titlebar.widget.minimizebutton(c),
      SP,
      awful.titlebar.widget.maximizedbutton(c),
      SP,
      awful.titlebar.widget.closebutton(c),
      layout = wibox.layout.fixed.horizontal
   }
   local titlebar_title = {
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
   awful.titlebar(c, {size = beautiful.titlebar_height,position = 'top'}):setup {
      {
         awful.titlebar.widget.ontopbutton(c),
         nil,
         titlebar_button,
         layout = wibox.layout.align.horizontal
      },
      left = 20,
      right = 20,
      top = 5,
      bottom = 5,
      layout = wibox.container.margin
   }
end)

