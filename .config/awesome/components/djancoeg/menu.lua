local beautiful = require('beautiful')
local awful = require('awful')
local gears = require('gears')

local icon = require('utils.icon')
local apps = require('utils.apps')


local function shapemanager(cr, w, h)
   gears.shape.rounded_rect(cr, w, h, beautiful.border_radius or 10)
end

local menu = awful.menu(
   {
      items = {
         {icon.gylph.launcher .. "Launcher", apps.launcher},
         { icon.gylph.terminal .. "Terminal", apps.terminal },
         { icon.gylph.firefox .. " Browser", apps.browser },
         { icon.gylph.edit .. " Text Editor", apps.text_editor },
         { icon.gylph.folder_open .. "File Manager", apps.file_manager },
      },
   }
)
-- Round corner menu
menu.wibox.shape = shapemanager
return menu
