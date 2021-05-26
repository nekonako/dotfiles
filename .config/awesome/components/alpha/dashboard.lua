local wibox = require('wibox')
local beautiful = require('beautiful')
local awful = require('awful')
local gears = require('gears')

local dashboard = wibox {
   visible = false,
   ontop = true,
   bg = '#F8F4FF' .. 'AA',
   type = 'dock'
}

awful.placement.maximize(dashboard)

local function dashboard_visibility()
   if dashboard.visible == true then
      dashboard.visible = false
   else
      dashboard.visible = true
   end
end

-- right click to hide dashboard
dashboard:buttons(gears.table.join(
   awful.button({ }, 3, function ()
      dashboard_visibility()
   end)
))

local function create_box(widget, width, height, bg)
   local container = wibox.container.background()
   container.bg = bg
   container.forced_height = height
   container.forced_width = width
   container.shape = box_radius
   local box_widget = wibox.widget {
      -- gap between box
      {
         -- container
         {
            -- center horizontal
            nil,
            {
               --  center vertical
               nil,
               widget,
               layout = wibox.layout.align.vertical,
               expand = "none"
            },
            layout = wibox.layout.align.horizontal,
            expand = "none"
         },
         widget = container,
      },
      margins = box_gap,
      widget = wibox.container.margin
   }
   return box_widget
end

local text = {
   text = "Hello",
   widget = wibox.widget.textbox,
}

local hello_box = create_box(text, 300, 300, '#ffffff')

dashboard:setup {
   nil,
   {
      nil,
      hello_box,
      nil,
      expand = "none",
      layout = wibox.layout.align.horizontal
   },
   nil,
   expand = "none",
   layout = wibox.layout.align.vertical
}
return dashboard
