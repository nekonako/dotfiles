local menubar = require("menubar")
local beautiful = require('beautiful')
local awful = require('awful')
local icon = require('icon')
local gears = require('gears')
require('apps')


local function shapemanager(cr, w, h)
   gears.shape.rounded_rect(cr, w, h, beautiful.border_radius or 10)
end

Menu = {
   { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "manual", Apps.terminal .. " -e man awesome" },
   { "edit config", Apps.text_editor .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end },
}

My_menu = awful.menu(
   {
      items = {
         {icon.launcher .. "Launcher", Apps.launcher},
         { icon.terminal .. "Terminal", Apps.terminal },
         { icon.firefox .. " Browser", Apps.browser },
         { icon.edit .. " Text Editor", Apps.text_editor },
         { icon.folder_open .. "File Manager", Apps.file_manager }
      },
   }
)
-- Round corner menu
My_menu.wibox.shape = shapemanager

-- menubar
menubar.utils.terminal = Apps.terminal
