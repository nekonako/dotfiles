local wibox = require('wibox')
local dpi = require("beautiful.xresources").apply_dpi
local color = require("beautiful.xresources").get_current_theme()
local awful = require('awful')
local beautiful = require('beautiful')
local gears = require('gears')
local icon = require('utils.icon')

local logout = wibox {
   visible = false,
   ontop = true,
   bg = beautiful.bg_normal .. 'AA',
   type = 'dock',
}

awful.placement.maximize(logout)

local function logout_visibility()
   logout.visible = not logout.visible
end

logout:buttons(gears.table.join(
   awful.button({ }, 3, function ()
      logout_visibility()
   end)
))

local function create_button(button_icon, action, button_color)
   local widget = wibox.widget {
      {
         text = button_icon,
         font = 'pragmatapro 30',
         widget = wibox.widget.textbox
      },
      fg = button_color,
      widget = wibox.container.background
   }

   widget:buttons(gears.table.join(awful.button({ }, 1,
      function()
         awful.spawn(action)
      end)
   ))

   return widget
end


local sugeng_ndalu = wibox.widget {
   text = 'Sugeng ndalu' .. ' ' .. os.getenv('USER'),
   font = 'Pacifico bold 50',
   widget = wibox.widget.textbox,
}

local clock = wibox.widget {
   format = '%R',
   font = 'Iosevka Mayukai 25',
   widget = wibox.widget.textclock
}

local day = wibox.widget {
   format = '%d %B, %Y',
   font = 'Iosevka Mayukai 15',
   widget = wibox.widget.textclock
}

local text_left = wibox.widget {
   nil,
   {
      {
         sugeng_ndalu,
         {
            clock,
            day,
            spacing = dpi(5),
            layout = wibox.layout.fixed.vertical
         },
         spacing = dpi(20),
         layout = wibox.layout.fixed.vertical
      },
      fg = color.color3,
      widget = wibox.container.background
   },
   nil,
   layout = wibox.layout.align.vertical
}

local power_button = create_button(icon.gylph.power, 'poweoff', color.color1)
local logout_button = create_button(icon.gylph.logout, 'pkill awesome', color.color2)
local reboot_button = create_button(icon.gylph.reboot, 'reboot', color.color6)
local home_button = create_button(icon.gylph.home, nil, color.color4)

home_button:buttons(gears.table.join(
   awful.button({ }, 1, function ()
      logout_visibility()
   end)
))

local button = wibox.widget {
   nil,
   {
      power_button,
      logout_button,
      reboot_button,
      home_button,
      spacing = dpi(20),
      layout = wibox.layout.fixed.vertical
   },
   nil,
   layout = wibox.layout.align.vertical
}

local left = wibox.widget {
   nil,
   {
      text_left,
      margins = dpi(50),
      layout = wibox.container.margin
   },
   nil,
   expand = "none",
   layout = wibox.layout.align.vertical
}

local right = wibox.widget {
   nil,
   {
      button,
      margins = dpi(50),
      layout = wibox.container.margin
   },
   nil,
   expand = "none",
   layout = wibox.layout.align.vertical
}

logout:setup {
   left,
   nil,
   right,
   layout = wibox.layout.align.horizontal,
}

return logout
