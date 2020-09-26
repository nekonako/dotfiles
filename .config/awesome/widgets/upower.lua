local awful = require("awful")
local function get_percentage(out)
  for k, v in string.gmatch(out, '([%a]+[%a|-]+):%s*([%a|%d]+[,|%a|%d]-)') do
    if k == "percentage" then
      return tonumber(v)
    end
  end
end
local cmd = "upower -i /org/freedesktop/UPower/devices/battery_BAT0"
local self = awful.widget.watch(cmd, 30,
  function(widget, out)
    widget:set_text(" " .. get_percentage(out) .. "%")
  end
)
function self:update()
  awful.spawn.easy_async(cmd, function(out)
    self:set_text(" " .. get_percentage(out) .. "%")
  end)
end

return self
