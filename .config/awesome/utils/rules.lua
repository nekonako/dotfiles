local ruled = require('ruled')
local awful = require('awful')
local beautiful = require('beautiful')

ruled.client.connect_signal("request::rules", function()
   -- All clients will match this rule.
   ruled.client.append_rule {
      id         = "global",
      rule       = { },
      properties = {
         border_width = beautiful.border_width,
         border_color = beautiful.border_normal,
         focus = awful.client.focus.filter,
         raise = true,
         -- screen = awful.screen.preferred,
         screen = awful.screen.focused,
         size_hints_honor = false,
         honor_workarea = true,
         honor_padding = true,
         maximized = false,
         titlebars_enabled = beautiful.titlebars_enabled,
         maximized_horizontal = false,
         maximized_vertical = false,
         placement = awful.placement.centered,
      }
   }

   -- Floating clients.
   ruled.client.append_rule {
      id       = "floating",
      rule_any = {
         instance = {
            "DTA",  -- Firefox addon DownThemAll.
            "copyq",  -- Includes session name in class.
            "floating_terminal",
            "riotclientux.exe",
            "leagueclientux.exe",
            "Alacritty",
            "Devtools", -- Firefox devtools
         },
         class = {
            "Gpick",
            "Lxappearance",
            "Nm-connection-editor",
            "File-roller",
            "fst",
            "Nvidia-settings",
            "Alacritty",
         },
         name = {
            "Event Tester",  -- xev
            "MetaMask Notification",
         },
         role = {
            "AlarmWindow",
            "pop-up",
            "GtkFileChooserDialog",
            "conversation",
         },
         type = {
            "dialog",
         }
      },
      properties = { floating = true }
   }

   -- Add titlebars to normal clients and dialogs
   ruled.client.append_rule {
      id         = "titlebars",
      rule_any   = { type = { "normal", "dialog" } },
      properties = { titlebars_enabled = true }
   }
end)
