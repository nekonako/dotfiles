
local wibox = require('wibox')
local vc = require('vicious')
local icon = require('utils.icon')


local temp = {}
local w = wibox.widget.textbox()

temp.text = vc.register(w, vc.widgets.thermal, "$1°C", 10, "thermal_zone0" )
temp.icon = {
   {
      image = icon.png.fire,
      widget = wibox.widget.imagebox
   },
   widget = wibox.layout.fixed.horizontal
}

return temp
