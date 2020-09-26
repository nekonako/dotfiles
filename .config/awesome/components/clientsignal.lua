local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local wibox = require("wibox")

local function shapemanager(c)
  c.shape = function(cr, w, h)
    if not c.fullscreen and not c.maximized then
      gears.shape.rounded_rect(cr, w, h, beautiful.border_radius or 10)
    else
      gears.shape.rounded_rect(cr, w, h, 0)
    end
  end
end

client.connect_signal("manage", function(c)
  if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
    awful.placement.no_offscreen(c)
  end
  shapemanager(c)
end)
client.connect_signal("request::geometry", function(c) shapemanager(c) end)
client.connect_signal("request::activate", function(c) shapemanager(c) end)
client.connect_signal("request::titlebars", function(c)
  local buttons = gears.table.join(
    awful.button({},1,function()
      c:emit_signal("request::activate", "titlebar", {raise = true})
      awful.mouse.client.move(c)
    end),
    awful.button({},3,function()
      c:emit_signal("request::activate", "titlebar", {raise = true})
      awful.mouse.client.resize(c)
    end)
  )
  local title_left = {
    awful.titlebar.widget.closebutton(c),
    awful.titlebar.widget.maximizedbutton(c),
    awful.titlebar.widget.minimizebutton(c),
    layout = wibox.layout.fixed.horizontal
  }
  local title_center = {
    {
      {
        align = "center",
        widget = awful.titlebar.widget.titlewidget(c)
      },
      right = 70,
      widget = wibox.container.margin
    },
    buttons = buttons,
    layout = wibox.layout.flex.horizontal
  }
  awful.titlebar(c, {size = beautiful.titlebar_height}):setup {
    {
      title_left,
      title_center,
      layout = wibox.layout.align.horizontal
    },
    left = 20,
    right = 20,
    top = 5,
    bottom = 5,
    layout = wibox.container.margin
  }
end)
