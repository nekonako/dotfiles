local vc = require('../vicious')
local wibox = require('wibox')
local icons = require('../icon')
local gears = require('gears')
local color = require('beautiful.xresources').get_current_theme()

Mpd = {}
local w = wibox.widget.textbox()
local getmpd = function(w, args)
   if args["{state}"] == "Stop" then
      return " Mpd off"
   else
      return " " .. args["{Artist}"] .. " - " .. args["{Title}"]
   end
end
Mpd.text = vc.register(w, vc.widgets.mpd, getmpd, 10 )
Mpd.icon =  {
   {
      text   = ' ' .. icons.music,
      widget = wibox.widget.textbox,
   },
   bg     = color.color4,
   widget = wibox.container.background,
   shape = gears.shape.rectangle,
   shape_clip  = true,
}

return Mpd
