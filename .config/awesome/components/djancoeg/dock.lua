-- local color = require('beautiful.xresources').get_current_theme
local dpi = require('beautiful.xresources').apply_dpi
local gears = require('gears')
local wibox  = require('wibox')
local awful = require('awful')
local beautiful = require('beautiful')
local icon = require('utils.icon')
local apps = require('utils.apps')
local dashboard = require('components.djancoeg.dashboard')
local logout = require('components.djancoeg.logout')

local dock = {item = {}}
local function shapemanager(cr, w, h)
   gears.shape.rounded_rect(cr, w, h, beautiful.border_radius or 10)
end
awful.screen.connect_for_each_screen(function (scr)
   local conf =  awful.util.getdir("config")
   local SP = wibox.widget {
      widget = wibox.widget.separator,
      forced_width = dpi(15),
      opacity = 0
   }
   dock.container = awful.wibar{
      position = "bottom",
      height = dpi(40),
      screen = scr,
      visible = true,
      -- shape = shapemanager
   }
   dock.terminal = {
      image =  icon.png.terminal,
      widget = wibox.widget.imagebox(),
   }
   dock.terminal.widget:buttons({
      awful.button({},1, function() awful.spawn(apps.terminal) end)
   })

   dock.music = {
      image = conf .. '/icons/crayon/music.png',
      widget = wibox.widget.imagebox(),
   }
   dock.music.widget:buttons({
      awful.button({},1, function() awful.spawn(apps.music) end)
   })

   dock.telegram = {
      image = conf .. '/icons/crayon/telegram.png',
      widget = wibox.widget.imagebox(),
   }
   dock.telegram.widget:buttons({
      awful.button({},1, function() awful.spawn(apps.telegram) end)
   })

   dock.youtube = {
      image = conf .. '/icons/crayon/youtube.png',
      widget = wibox.widget.imagebox(),
   }
   dock.youtube.widget:buttons({
      awful.button({},1, function() awful.spawn(apps.youtube) end)
   })

   dock.file_manager = {
      image = conf .. '/icons/crayon/file_manager.png',
      widget = wibox.widget.imagebox(),
   }
   dock.file_manager.widget:buttons({
      awful.button({},1, function() awful.spawn(apps.file_manager) end)
   })

   dock.reddit = {
      image = conf .. '/icons/crayon/reddit.png',
      widget = wibox.widget.imagebox(),
   }
   dock.reddit.widget:buttons({
      awful.button({},1, function() awful.spawn(apps.reddit) end)
   })

   dock.firefox = {
      image = conf .. '/icons/crayon/firefox.png',
      widget = wibox.widget.imagebox(),
   }

   dock.firefox.widget:buttons({
      awful.button({},1, function() awful.spawn(apps.firefox) end)
   })

   dock.brave = {
      image = conf .. '/icons/crayon/brave.png',
      widget = wibox.widget.imagebox(),
   }
   dock.brave.widget:buttons({
      awful.button({},1, function() awful.spawn(apps.brave) end)
   })

   dock.spotify = {
      image = conf .. '/icons/crayon/spotify.png',
      widget = wibox.widget.imagebox(),
   }
   dock.spotify.widget:buttons({
      awful.button({},1, function() awful.spawn(apps.spotify) end)
   })
   dock.dashboard = {
      image = icon.png.launcher,
      widget = wibox.widget.imagebox()
   }
   dock.dashboard.widget:buttons({
      awful.button({}, 1, function()
         if dashboard.visible == false then
            dashboard.visible = true
         else
            dashboard.visible = false
         end
      end)
   })

   dock.logout = {
      image = icon.png.launcher,
      widget = wibox.widget.imagebox()
   }
   dock.logout.widget:buttons({
      awful.button({}, 1, function()
         if logout.visible == false then
            logout.visible = true
         else
            logout.visible = false
         end
      end)
   })


   dock.container : setup {
      layout = wibox.layout.stack,
      {
         layout = wibox.layout.align.horizontal,
         {
            dock.dashboard,
            layout = wibox.layout.fixed.horizontal,
         },
         {
            {
               dock.music,
               SP,
               dock.terminal,
               SP,
               dock.reddit,
               SP,
               dock.file_manager,
               SP,
               dock.youtube,
               SP,
               dock.telegram,
               SP,
               dock.firefox,
               SP,
               dock.spotify,
               SP,
               dock.brave,
               layout = wibox.layout.fixed.horizontal,
            },
            valign = 'center',
            halign = 'center',
            layout = wibox.container.place,
         },
         {
            dock.logout,
            layout = wibox.layout.fixed.horizontal,
         },
      },
   }
end)

-- set auto hide dock when window not on floating mode
-- client.connect_signal("property::floating", function(c)
--    if c.floating then
--       dock.container.visible = true
--    else
--       dock.container.visible = false
--    end
-- end)
-- client.connect_signal("manage", function(c)
--    if c.floating or c.first_tag.layout.name == "floating" then
--       dock.container.visible = true
--    else
--       dock.container.visible = true
--    end
-- end)

-- tag.connect_signal("properties::layout", function(c)
--    local clients = c.clients()
--    for k,v in pairs(clients) do
--       if v.floating or v.first_tag.layout.name == "floating" then
--          dock.container.visible = true
--       else
--          dock.container.visible = false
--       end
--    end
-- end)
--

return dock

