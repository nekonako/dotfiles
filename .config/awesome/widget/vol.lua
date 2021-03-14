local wibox = require('wibox')
local vc = require('vicious')
local icon = require('utils.icon')

local vol = {}
local w = wibox.widget.textbox()

vol.text = vc.register(w, vc.widgets.volume, "$1 %", 10, "Master")
vol.icon = {
   {
      image = icon.png.volume,
      widget = wibox.widget.imagebox,
   },
   layout = wibox.layout.fixed.horizontal
}
return vol
