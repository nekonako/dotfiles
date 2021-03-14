local wibox = require('wibox')
local vc = require('vicious')
local icon = require('utils.icon')

local hdd = {}
local w = wibox.widget.textbox()

hdd.text = vc.register(w, vc.widgets.fs, "${/ size_gb} GB")
hdd.icon = {
   {
      image = icon.png.storage,
      widget = wibox.widget.imagebox,

   },
   layout = wibox.layout.fixed.horizontal,

}

return hdd
