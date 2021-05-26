-- local color = require('beautiful.xresources').get_current_theme
local dpi = require('beautiful.xresources').apply_dpi
local wibox  = require('wibox')
local awful = require('awful')
local icon = require('utils.icon')
local apps = require('utils.apps')
local color = require("beautiful.xresources").get_current_theme()
local dashboard = require('components.djancoeg.dashboard')
local logout = require('components.djancoeg.logout')


awful.screen.connect_for_each_screen(function (scr)

   local dock = awful.wibar{
      position = "bottom",
      height = dpi(40),
      screen = scr,
      visible = true,
      bg = color.background
   }

   local function create_img_widget(image, action)
      local widget = wibox.widget {
         image = image,
         widget = wibox.widget.imagebox()
      }
      widget:buttons({
         awful.button({}, 1, function() awful.spawn(action) end)
      })
      return widget
   end

   local terminal = create_img_widget(icon.png.terminal, apps.terminal)
   local music = create_img_widget(icon.png.music, apps.music)
   local telegram = create_img_widget(icon.png.telegram, apps.telegram)
   local youtube = create_img_widget(icon.png.youtube, apps.youtube)
   local file_manager = create_img_widget(icon.png.file_manager, apps.file_manager)
   local reddit = create_img_widget(icon.png.reddit, apps.reddit)
   local firefox = create_img_widget(icon.png.firefox, apps.firefox)
   local brave = create_img_widget(icon.png.brave, apps.brave)
   local spotify = create_img_widget(icon.png.spotify, apps.spotify)

   local function create_widget_spawner(image, spawn)
      local widget = wibox.widget {
         image = image,
         widget = wibox.widget.imagebox()
      }
      widget:buttons({
         awful.button({}, 1, function()
            if spawn.visible == false then
               spawn.visible = true
            else
               spawn.visible = false
            end
         end)
      })
      return widget
   end

   local dashboard_button = create_widget_spawner(icon.png.launcher, dashboard)
   local logout_button = create_widget_spawner(icon.png.launcher, logout)

   dock : setup {
      {
                  dashboard_button,
         layout = wibox.layout.fixed.horizontal,
      },
      {
         {
            music,
            terminal,
            reddit,
            file_manager,
            youtube,
            telegram,
            firefox,
            spotify,
            brave,
            spacing = dpi(15),
            layout = wibox.layout.fixed.horizontal,
         },
         valign = 'center',
         halign = 'center',
         layout = wibox.container.place,
      },
      {
                  logout_button,
         layout = wibox.layout.fixed.horizontal,
      },
      layout = wibox.layout.align.horizontal
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

