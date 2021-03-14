local naughty = require("naughty")
local beautiful = require("beautiful")
local dpi = require("beautiful.xresources").apply_dpi

naughty.config.padding = beautiful.notification_padding or dpi(20)
naughty.config.defaults.position = "bottom_center"
naughty.config.defaults.timeout = 20
naughty.config.defaults.margin = beautiful.notification_margin or dpi(10)
naughty.config.defaults.border_width = beautiful.notification_border_width or dpi(0)

if awesome.startup_errors then
   naughty.notify({
      preset = naughty.config.presets.critical,
      title = "Oops, there were errors during startup!",
      text = awesome.startup_errors
   })
end

do
local in_error = false
awesome.connect_signal("debug::error", function(e)
   if in_error then
      return
   end
   in_error = true
   naughty.notify({
      preset = naughty.config.presets.critical,
      title = "Oops, an error happened!",
      text = tostring(e)
   })
   in_error = false
end)
end
