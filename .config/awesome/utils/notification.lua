local naughty = require('naughty')
local ruled = require('ruled')
local awful = require('awful')

ruled.notification.connect_signal('request::rules', function()
   -- All notifications will match this rule.
   ruled.notification.append_rule {
      rule       = { },
      properties = {
         screen           = awful.screen.preferred,
         implicit_timeout = 5,
      }
   }
end)

naughty.connect_signal("request::display", function(n)
   naughty.layout.box { notification = n }
end)

-- }}}

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
   c:activate { context = "mouse_enter", raise = false }
end)
