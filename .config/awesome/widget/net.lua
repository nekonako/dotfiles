local vc = require('vicious')
local wibox = require('wibox')
local icon = require('utils.icon')
local color = require('beautiful.xresources').get_current_theme()

local net = {}
local w = wibox.widget.textbox()

net.text = vc.register(w, vc.widgets.net, '${wlo1 up_kb} kb', 10, "wlo1")
net.icon = {
   {
      text   = ' ' .. icon.gylph.signal,
      widget = wibox.widget.textbox,
   },
   fg     = color.color6,
   widget = wibox.container.background,
}

return net
