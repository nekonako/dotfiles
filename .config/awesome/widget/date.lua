local vc = require('vicious')
local wibox = require('wibox')
local icon = require('utils.icon')
local gears = require('gears')
-- local calendar = require('../popup.calendar.lua')
-- local awful = require('awful')

local date = {}
local w = wibox.widget.textbox()

date.text = vc.register(w, vc.widgets.date, "%b %d, %R")
date.icon = {
   {
      image = icon.png.calendar,
      widget = wibox.widget.imagebox,
   },
   layout = wibox.layout.fixed.horizontal,
   shape = gears.shape.rectangle,
   shape_clip  = true,
}

-- w.widget:buttons({
--    awful.button({}, 1,calendar.month:toggle())
-- })

return date
