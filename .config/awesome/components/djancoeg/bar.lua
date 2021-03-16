local awful = require("awful")
local wibox = require("wibox")
local dpi = require("beautiful.xresources").apply_dpi
local icon = require('utils.icon')

--  widget
local ram = require("widget.ram")
local date = require("widget.date")
local mpd = require('widget.mpd')
local cpu = require('widget.cpu')
local temp = require('widget.temp')
local vol = require('widget.vol')
local wifi = require('widget.wifi')
local hdd = require('widget.hdd')
local net = require('widget.net')

awful.screen.connect_for_each_screen(function(scr)

   local bar = awful.wibar {
      position = "top",
      screen = scr
   }

   -- taglist a.k.a workspaces
   local function create_tag(identifier, workspace_icon)
      awful.tag.add(
         identifier,
         {
            icon = workspace_icon,
            layout = awful.layout.suit.title
         }
      )
   end

   create_tag('one', icon.png.w1)
   create_tag('two', icon.png.w2)
   create_tag('three', icon.png.w3)
   create_tag('four', icon.png.w4)

   local btn_tag = awful.button({}, 1, function(t) t:view_only() end)

   local taglist = awful.widget.taglist {
      screen = scr,
      buttons = btn_tag,
      filter = awful.widget.taglist.filter.all,
      widget_template = {
         {
            {
               {
                  id = "icon_role",
                  widget = wibox.widget.imagebox
               },
               left = 5,
               right = 5,
               widget = wibox.container.margin
            },
            id = "background_role",
            widget = wibox.container.background
         },
         right = 5,
         widget = wibox.container.margin,
      }
   }

   local left = {
      taglist,
      spacing = dpi(10),
      layout = wibox.layout.fixed.horizontal
   }

   local middle = {
      mpd.icon,
      mpd.text,
      layout = wibox.layout.fixed.horizontal
   }

   local right = {
      net.icon,
      net.text,
      hdd.icon,
      hdd.text,
      wifi.icon,
      wifi.text,
      vol.icon,
      vol.text,
      temp.icon,
      temp.text,
      cpu.icon,
      cpu.text,
      ram.icon,
      ram.text,
      date.icon,
      date.text,
      spacing = dpi(10),
      layout = wibox.layout.fixed.horizontal
   }

   bar : setup {
      {
         left,
         middle,
         right,
         layout = wibox.layout.align.horizontal
      },
      left = 0,
      right = 10,
      widget = wibox.container.margin
   }
end)

-- dynamic wibar corner radius
-- local function wibar_shapemanager(c)
--    bar.main.shape = function(cr, w, h)
--       if c.fullscreen or c.maximized then
--          gears.shape.partially_rounded_rect(cr, w, h, false, false, true, true, 0)
--       else
--          gears.shape.partially_rounded_rect(cr, w, h, false, false, true, true,
--             beautiful.wibar_corner_radius or 10)
--       end
--    end
-- end

-- set wibar corner radius
-- client.connect_signal("manage", function(c) wibar_shapemanager(c) end)
-- client.connect_signal("request::geometry", function(c) wibar_shapemanager(c) end)
-- client.connect_signal("request::activate", function(c) wibar_shapemanager(c) end)
-- screen.connect_signal("tag::history::update", function(c) wibar_shapemanager(c) end)

