local vc = require('vicious')
local wibox = require('wibox')
local icon = require('utils.icon')

local mpd = {}
local w = wibox.widget.textbox()
local getmpd = function(_, args)
   if args["{state}"] == " Stop" then
      return " mpd off"
   else
      return ' ' .. args["{Artist}"] .. " - " .. args["{Title}"]
   end
end
mpd.text = vc.register(w, vc.widgets.mpd, getmpd, 10 )
mpd.icon =  {
   {
      image   = icon.png.music_player,
      widget = wibox.widget.imagebox,
   },
   layout = wibox.layout.fixed.horizontal
}

return mpd
