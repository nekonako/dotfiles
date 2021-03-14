local vc = require('vicious')
local wibox = require('wibox')
local icon = require('utils.icon')
local color = require('beautiful.xresources').get_current_theme()
local gears = require('gears')

local net = {}
local w = wibox.widget.textbox()

net.text = vc.register(w, vc.widgets.net, '${wlo1 carrier}', 10, "wlo1")
net.icon = {
   {
      text   = ' ' .. icon.gylph.cpu,
      widget = wibox.widget.textbox,
   },
   bg     = color.color5,
   widget = wibox.container.background,
   shape = gears.shape.rectangle,
   shape_clip  = true,
}

return net
