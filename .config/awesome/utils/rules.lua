local ruled = require('ruled')
local awful = require('awful')
local beautiful = require('beautiful')

ruled.client.connect_signal("request::rules", function()
   -- All clients will match this rule.
   ruled.client.append_rule {
      id         = "global",
      rule       = { },
      properties = {
         focus     = awful.client.focus.filter,
         raise     = false,
         screen    = awful.screen.preferred,
         placement = awful.placement.no_overlap+awful.placement.no_offscreen,
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
            "Gcolor3",
            "Rofi",
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
      properties = {
         floating = true,
         placement = awful.placement.centered,
      }
   }

   -- Add titlebars to normal clients and dialogs
   ruled.client.append_rule {
      id         = "titlebars",
      rule_any   = { type = { "normal", "dialog" } },
      properties = { titlebars_enabled = true }
   }
end)
