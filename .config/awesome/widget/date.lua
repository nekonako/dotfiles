local vc = require('../vicious')
local wibox = require('wibox')
local icon = require('../icon')
local color = require('beautiful.xresources').get_current_theme()
local gears = require('gears')
local awful = require('awful')

Date = {}
local w = wibox.widget.textbox()

Date.text = vc.register(w, vc.widgets.date, " %b %d, %R")
Date.icon = {
   {
      text   = ' ' .. icon.calendar .. ' ',
      widget = wibox.widget.textbox,
   },
   bg     = color.color4,
   widget = wibox.container.background,
   shape = gears.shape.rectangle,
   shape_clip  = true,
}

-- function cal()
--    wibox.widget {
--    date     = os.date('*t'),
--    font     = "sans medium 13",
--    widget   = wibox.widget.calendar.month()
-- }
-- end
-- Date.icon.widget:buttons({
--    awful.button({  },1, function() cal() end),
-- })

return Date
