local icon = require('utils.icon')
local awful = require('awful')

-- taglist a.k.a workspaces
awful.screen.connect_for_each_screen(function (scr)
   local function create_tag(identifier, workspace_icon)
      awful.tag.add(
         identifier,
         {
            icon = workspace_icon,
            layout = awful.layout.suit.title
         }
      )
   end

   create_tag('one', icon.png.w1)
   create_tag('two', icon.png.w2)
   create_tag('three', icon.png.w3)
   create_tag('four', icon.png.w4)
end)
