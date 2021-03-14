local wibox = require('wibox')
local vc = require('vicious')
local icon = require('utils.icon')

local wifi = {}
local w = wibox.widget.textbox()

wifi.text = vc.register(w, vc.widgets.wifi, "${ssid}", 10, "wlo1")
wifi.icon = {
   {
      image = icon.png.wifi,
      widget = wibox.widget.imagebox
   },
   layout = wibox.layout.fixed.horizontal
}
return wifi
