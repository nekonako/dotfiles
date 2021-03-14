local vc = require('vicious')
local wibox = require('wibox')
local icon = require('utils.icon')
local color = require('beautiful.xresources').get_current_theme()
local gears = require('gears')

local ram = {}
local w = wibox.widget.textbox()
vc.cache(vc.widgets.mem)
ram.text = vc.register(w, vc.widgets.mem, "$2 MB", 1)
ram.icon = {
   {
      image = icon.png.mem,
      widget = wibox.widget.imagebox,
   },
   layout = wibox.layout.fixed.horizontal,
}

return ram
