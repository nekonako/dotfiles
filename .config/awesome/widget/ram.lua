local vc = require('../vicious')
local wibox = require('wibox')
local icon = require('../icon')
local color = require('beautiful.xresources').get_current_theme()
local gears = require('gears')
Ram = {}
local w = wibox.widget.textbox()
vc.cache(vc.widgets.mem)
Ram.text = vc.register(w, vc.widgets.mem, " $2 MB", 1)
Ram.icon = {
   {
      text   = ' ' .. icon.cpu,
      widget = wibox.widget.textbox,
   },
   bg     = color.color5,
   widget = wibox.container.background,
   shape = gears.shape.rectangle,
   shape_clip  = true,
}

return Ram
