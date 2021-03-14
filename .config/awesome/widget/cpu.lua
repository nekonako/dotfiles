local wibox = require('wibox')
local vc = require('vicious')
local icon = require('utils.icon')

local cpu = {}
local w = wibox.widget.textbox()
vc.cache(vc.widgets.cpu)

cpu.text = vc.register(w, vc.widgets.cpu, "$1 %")
cpu.icon = {
   {
      image = icon.png.heart,
      widget = wibox.widget.imagebox,
   },
   widget = wibox.layout.fixed.horizontal,
}

return cpu
