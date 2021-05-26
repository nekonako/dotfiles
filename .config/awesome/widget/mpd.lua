local vc = require('vicious')
local wibox = require('wibox')
local icon = require('utils.icon')
local color = require("beautiful.xresources").get_current_theme()

local mpd = {}
local w = wibox.widget.textbox()
local getmpd = function(_, args)
   if args["{state}"] == " Stop" then
      return " mpd off"
   else
      return ' ' .. args["{Artist}"] .. " - " .. args["{Title}"]
   end
end
mpd.text = vc.register(w, vc.widgets.mpd, getmpd, 1 )
mpd.icon =  {
   {
      image   = icon.png.music_player,
      widget = wibox.widget.imagebox,
   },
   layout = wibox.layout.fixed.horizontal
}

mpd.gylph = {
   fg = color.blue,
   {
      text = icon.gylph.music,
      widget = wibox.widget.textbox
   },
   layout = wibox.container.background
}

return mpd
