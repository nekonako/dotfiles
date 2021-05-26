local beautiful = require('beautiful')
local awful = require('awful')
local wibox = require('wibox')
local gears = require('gears')

local function shapemanager(c)
   c.shape = function(cr, w, h)
      if not c.fullscreen and not c.maximized then
         gears.shape.rounded_rect(cr, w, h, beautiful.border_radius or 10)
      else
         gears.shape.rounded_rect(cr, w, h, 0)
      end
   end
end


client.connect_signal("manage", function(c)
   if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
      awful.placement.no_offscreen(c)
   end
   shapemanager(c)
end)

client.connect_signal("request::geometry", function(c) shapemanager(c) end)
client.connect_signal("request::activate", function(c) shapemanager(c) end)


client.connect_signal("request::titlebars", function(c)
   local buttons = gears.table.join(
      awful.button({},1,function()
         c:emit_signal("request::activate", "titlebar", {raise = true})
         awful.mouse.client.move(c)
      end),
      awful.button({},3,function()
         c:emit_signal("request::activate", "titlebar", {raise = true})
         awful.mouse.client.resize(c)
      end)
   )

   local titlebar_button = {
      awful.titlebar.widget.closebutton(c),
      awful.titlebar.widget.maximizedbutton(c),
      awful.titlebar.widget.minimizebutton(c),
      spacing = 10,
      layout = wibox.layout.fixed.vertical
   }

   local titlebar_title = {
      {
         align = "center",
         widget = awful.titlebar.widget.titlewidget(c)
      },
      direction = 'west',
      layout = wibox.container.rotate
   }

   awful.titlebar(c, {size = beautiful.titlebar_height, position = 'left'}):setup {
      {
         titlebar_button,
         nil,
         --titlebar_title,
         awful.titlebar.widget.ontopbutton(c),
         layout = wibox.layout.align.vertical
      },
      left = 7,
      right = 7,
      top = 10,
      bottom = 10,
      layout = wibox.container.margin
   }

end)

