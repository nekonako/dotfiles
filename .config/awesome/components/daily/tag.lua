local icon = require('utils.icon')
local awful = require('awful')

-- taglist a.k.a workspaces
screen.connect_signal("request::desktop_decoration", function(s)

   local l = awful.layout.suit -- Alias to save time :)
   -- Tag layouts
   local layouts = {
      l.max,
      l.max,
      l.max,
      l.max,
      l.tile,
      l.max,
      l.max,
      l.max,
      l.tile,
      l.max
   }

   local function create_tag(identifier, workspace_icon)
      awful.tag.add(
         identifier,
         {
            icon = workspace_icon,
            layout = layouts
         }
      )
   end

   create_tag('one', icon.png.w1)
   create_tag('two', icon.png.w2)
   create_tag('three', icon.png.w3)
   create_tag('four', icon.png.w4)
end)
