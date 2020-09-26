local awful = require("awful")
local cmd = "light -G"
local self = awful.widget.watch(cmd, 30,
  function(widget, out)
    local bright = string.gsub(out, "\n", "")
    widget:set_text(" "..bright .. "%")
  end
)
function self:update()
  awful.spawn.easy_async(cmd, function(out)
    local bright = string.gsub(out, "\n", "")
    self:set_text(" "..bright .. "%")
  end)
end

return self
