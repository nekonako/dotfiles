local theme = require('theme')
local dpi = require('beautiful.xresources').apply_dpi
local wibox  = require('wibox')
local awful = require('awful')
local icon = require('utils.icon')
local color = require("beautiful.xresources").get_current_theme()
local dashboard = require('components.' .. theme .. '.dashboard')
local logout = require('components.djancoeg.logout')
local date = require('widget.date')
local mpd = require('widget.mpd')

awful.screen.connect_for_each_screen(function (scr)

   local panel = awful.wibar{
      height = dpi(35),
      position = "bottom",
      screen = scr,
      visible = true,
      fg= color.foreground,
      bg = color.background
   }

   local function create_widget_spawner(text, spawn, bg)
      local widget = wibox.widget {
         {
            {
               text = text,
               forced_height = dpi(40),
               forced_width = dpi(40),
               valign = 'center',
               align = 'center',
               font = 'pragmatapro 17',
               widget = wibox.widget.textbox()
            },
            bg = bg,
            fg = color.background,
            widget = wibox.container.background
         },
         margins = dpi(0),
         widget = wibox.container.margin
      }
      widget:buttons({
         awful.button({}, 1, function()
            if spawn.visible == false then
               spawn.visible = true
            else
               spawn.visible = false
            end
         end)
      })
      return widget
   end

   local dashboard_button = create_widget_spawner(icon.gylph.launcher, dashboard, color.color1)
   local logout_button = create_widget_spawner(icon.gylph.power, logout, color.color1)

   panel : setup {
      {
         {
            dashboard_button,
            layout = wibox.layout.fixed.horizontal,
         },
         {
            {
               mpd.gylph,
               mpd.text,
               spacing = dpi(10),
                  layout = wibox.layout.fixed.horizontal,
            },

            left = dpi(20),
            layout = wibox.container.margin
         },
         layout = wibox.layout.fixed.horizontal,
      },
      nil,
      {
         {
            fg = color.foreground,
            date.text,
            layout = wibox.container.background
         },
         logout_button,
         spacing = dpi(15),
         layout = wibox.layout.fixed.horizontal
      },
      layout = wibox.layout.align.horizontal
   }

end)

