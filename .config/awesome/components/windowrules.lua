local awful = require("awful")
local beautiful = require("beautiful")
local bindings = require("components.bindings")
return {
  {
    rule = {},
    properties = {
     border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            keys = bindings.clientkeys,
            buttons = bindings.clientbuttons,
            -- screen = awful.screen.preferred,
            screen = awful.screen.focused,
            size_hints_honor = false,
            honor_workarea = true,
            honor_padding = true,
            maximized = false,
            titlebars_enabled = beautiful.titlebars_enabled,
            maximized_horizontal = false,
            maximized_vertical = false,
            placement = floating_client_placement
    }
  },
  {
        rule_any = {
            instance = {
                "DTA",  -- Firefox addon DownThemAll.
                "copyq",  -- Includes session name in class.
                "floating_terminal",
                "riotclientux.exe",
                "leagueclientux.exe",
                "Devtools", -- Firefox devtools
            },
            class = {
                "Gpick",
                "Lxappearance",
                "Nm-connection-editor",
                "File-roller",
                "fst",
                "Nvidia-settings",
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
    },
  -- CSD
  {
    rule_any = {
      type = {"normal", "dialog"}
    },
    properties = {
      titlebars_enabled = function(c)
        return not c.requests_no_titlebar
      end
    }
  },
  -- rxvt-unicode size workaround
  {
    rule = {
      class = "st"
    },
    properties = {size_hints_honor = false}
  },
  -- media apps
  {
    rule_any = {
      class = {
        "feh",
        "Viewnior",
        "mpv",
        "Gimp",
        "Inkscape",
      }
    },
    except = {
      type = "dialog"
    },
    properties = {
      floating = true,
      maximized = true
    }
  },
  -- logout ui
  {
    rule = {
      class = "[Cc]learine"
    },
    properties = {
      skip_taskbar = true,
      fullscreen = true,
      above = true,
    }
  },
  -- filechooser and regular dialog
  {
    rule = {
      type = "dialog"
    },
    properties = {
      floating = true,
      placement = awful.placement.centered
    }
  },
}
