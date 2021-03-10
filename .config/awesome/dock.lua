-- local color = require('beautiful.xresources').get_current_theme
local dpi = require('beautiful.xresources').apply_dpi
local gears = require('gears')
local wibox  = require('wibox')
local awful = require('awful')
local beautiful = require('beautiful')


Dock = {item = {}}

local function shapemanager(cr, w, h)
   gears.shape.rounded_rect(cr, w, h, beautiful.border_radius or 10)
end

awful.screen.connect_for_each_screen(function (scr)
   local SP = wibox.widget {
      widget = wibox.widget.separator,
      forced_width = dpi(15),
      opacity = 0
   }
   Dock.container = awful.wibar{
      position = "bottom",
      height = dpi(50),
      width = dpi(530),
      screen = scr,
      visible = true,
      shape = shapemanager
   }
   Dock.terminal = {
      image = '/home/nako/.config/awesome/icons/terminal.png',
      widget = wibox.widget.imagebox(),
      command = function() awful.spawn('alacritty') end
   }
   Dock.terminal.widget:buttons({
      awful.button({},1, function() Dock.terminal.command() end)
   })

   Dock.music = {
      image = '/home/nako/.config/awesome/icons/music.png',
      widget = wibox.widget.imagebox(),
      command = function() awful.spawn('alacritty --command ncmpcpp') end
   }
   Dock.music.widget:buttons({
      awful.button({},1, function() Dock.music.command() end)
   })

   Dock.telegram = {
      image = '/home/nako/.config/awesome/icons/telegram.png',
      widget = wibox.widget.imagebox(),
      command = function() awful.spawn('telegram-desktop') end
   }
   Dock.telegram.widget:buttons({
      awful.button({},1, function() Dock.telegram.command() end)
   })

   Dock.youtube = {
      image = '/home/nako/.config/awesome/icons/youtube.png',
      widget = wibox.widget.imagebox(),
      command = function() awful.spawn('brave') end
   }
   Dock.youtube.widget:buttons({
      awful.button({},1, function() Dock.youtube.command() end)
   })

   Dock.file_manager = {
      image = '/home/nako/.config/awesome/icons/files.png',
      widget = wibox.widget.imagebox(),
      command = function() awful.spawn('thunar') end
   }
   Dock.file_manager.widget:buttons({
      awful.button({},1, function() Dock.youtube.command() end)
   })

   Dock.reddit = {
      image = '/home/nako/.config/awesome/icons/reddit.png',
      widget = wibox.widget.imagebox(),
      command = function() awful.spawn('brave') end
   }
   Dock.reddit.widget:buttons({
      awful.button({},1, function() Dock.reddit.command() end)
   })

   Dock.github = {
      image = '/home/nako/.config/awesome/icons/github.png',
      widget = wibox.widget.imagebox(),
      command = function() awful.spawn('brave') end
   }
   Dock.github.widget:buttons({
      awful.button({},1, function() Dock.github.command() end)
   })

   Dock.browser = {
      image = '/home/nako/.config/awesome/icons/firefox.png',
      widget = wibox.widget.imagebox(),
      command = function() awful.spawn('brave') end
   }
   Dock.browser.widget:buttons({
      awful.button({},1, function() Dock.browser.command() end)
   })

   Dock.container : setup {
      {
         Dock.music,
         SP,
         Dock.terminal,
         SP,
         Dock.reddit,
         SP,
         Dock.file_manager,
         SP,
         Dock.youtube,
         SP,
         Dock.telegram,
         SP,
         Dock.github,
         SP,
         Dock.browser,
         layout = wibox.layout.fixed.horizontal
      },
      left = 10,
      right = 10,
      widget = wibox.container.margin
   }
end)


client.connect_signal("property::floating", function(c)
   if c.floating then
      Dock.container.visible = true
   else
      Dock.container.visible = false
   end
end)
client.connect_signal("manage", function(c)
   if c.floating or c.first_tag.layout.name == "floating" then
      Dock.container.visible = true
      else
       Dock.container.visible = true
   end
end)

tag.connect_signal("properties::layout", function(c)
   local clients = c.clients()
   for k,v in pairs(clients) do
      if v.floating or v.first_tag.layout.name == "floating" then
         Dock.container.visible = true
      else
         Dock.container.visible = false
      end
   end
end)


return Dock
