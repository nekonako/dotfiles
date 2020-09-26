local awful = require("awful")
local self = awful.widget.watch("ponymix get-volume", 5,
  function(widget, stdout)
    local vol = string.gsub(stdout, "\n", "")
    widget:set_text(" " .. vol .. "%")
  end
)
function self:update()
  awful.spawn.easy_async("ponymix get-volume", function(out)
    local vol = string.gsub(out, "\n", "")
    self:set_text(" " .. vol .. "%")
  end)
end

return self
