local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local dpi = require("beautiful.xresources").apply_dpi
local icon = require('utils.icon')

local bar = { item = {} }
awful.screen.connect_for_each_screen(function(scr)

   -- separator
   local SP = wibox.widget {
      widget = wibox.widget.separator,
      forced_width = dpi(10),
      opacity = 0
   }

   -- taglist a.k.a workspaces
   awful.tag.add(
      'first tag',
      {
         icon = icon.png.w1,
         layout = awful.layout.suit.title,
      }
   )
   awful.tag.add(
      'first tag',
      {
         icon = icon.png.w2,
         layout = awful.layout.suit.title,
      }
   )
   awful.tag.add(
      'first tag',
      {
         icon = icon.png.w3,
         layout = awful.layout.suit.title,
      }
   )
   awful.tag.add(
      'first tag',
      {
         icon = icon.png.w4,
         layout = awful.layout.suit.title,
      }
   )

   local btn_tag = gears.table.join(
      awful.button({}, 1, function(t) t:view_only() end),
      awful.button({Mod}, 1, function(t)
         if client.focus then
            client.focus:move_to_tag(t)
         end
      end),
      awful.button({}, 3, awful.tag.viewtoggle),
      awful.button({Mod}, 3, function(t)
         if client.focus then
            client.focus:toggle_tag(t)
         end
      end),
      awful.button({}, 4, function(t) awful.tag.viewnext(t.screen) end),
      awful.button({}, 5, function(t) awful.tag.viewprev(t.screen) end)
   )

   bar.taglist = awful.widget.taglist {
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

   -- tasklist
   local btn_task = gears.table.join(
      awful.button({}, 1, function(c)
         if c == client.focus then
            c.minimized = true
         else
            c:emit_signal("request::activate", "tasklist", {raise = true})
         end
      end),
      awful.button({}, 4, function() awful.client.focus.byidx(1) end),
      awful.button({}, 5, function() awful.client.focus.byidx(-1) end)
   )
   bar.tasklist = awful.widget.tasklist {
      screen = scr,
      filter = awful.widget.tasklist.filter.currenttags,
      buttons = btn_task,
      layout   = {
         layout  = wibox.layout.fixed.horizontal
      },
      widget_template = {
         {
            {
               {
                  id = 'text_role',
                  widget = wibox.widget.textbox
               },
               left = 10,
               right = 10,
               bottom = 2,
               widget  = wibox.container.margin
            },
            id = 'background_role',
            widget = wibox.container.background,
         },
         top = 0,
         bottom = 0,
         widget  = wibox.container.margin
      },
   }

   --  widget
   local ram = require("widget.ram")
   local date = require("widget.date")
   local mpd = require('widget.mpd')
   local cpu = require('widget.cpu')
   local temp = require('widget.temp')
   local vol = require('widget.vol')
   local wifi = require('widget.wifi')
   local hdd = require('widget.hdd')
   -- local net = require('widget.net')

   -- layouts
   bar.left = {
      bar.taglist, SP,
      layout = wibox.layout.fixed.horizontal
   }
   bar.middle = {
      mpd.icon,
      mpd.text,
      SP,
      --bar.tasklist,
      layout = wibox.layout.align.horizontal
   }
   bar.right = {
      -- net.icon.
      -- SP,
      -- net.text,
      -- SP,
      hdd.icon,
      SP,
      hdd.text,
      SP,
      wifi.icon,
      SP,
      wifi.text,
      SP,
      vol.icon,
      SP,
      vol.text,
      SP,
      temp.icon,
      SP,
      temp.text,
      SP,
      cpu.icon,
      SP,
      cpu.text,
      SP,
      ram.icon,
      SP,
      ram.text,
      SP,
      date.icon,
      SP,
      date.text,
      layout = wibox.layout.fixed.horizontal
   }

   -- setup main wibar
   bar.main = awful.wibar {
      position = "top",
      screen = scr
   }
   bar.main:setup {
      {
         bar.left,
         bar.middle,
         bar.right,
         layout = wibox.layout.align.horizontal
      },
      left = 0,
      right = 10,
      widget = wibox.container.margin
   }
end)

return bar

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

