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
