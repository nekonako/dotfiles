local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local wibox = require("wibox")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

panel = { item = {} }

awful.screen.connect_for_each_screen(function(scr)
  -- separator
  local SP = wibox.widget {
    widget = wibox.widget.separator,
    forced_width = dpi(10),
    opacity = 0
  }
  -- taglist a.k.a workspaces
  awful.tag({"ターミナル", "ミュージック", "ウェブ", "コード"}, scr, awful.layout.layouts[1])
  local btn_tag = gears.table.join(
    awful.button({}, 1, function(t) t:view_only() end),
    awful.button({modkey}, 1, function(t)
      if client.focus then
        client.focus:move_to_tag(t)
      end
    end),
    awful.button({}, 3, awful.tag.viewtoggle),
    awful.button({modkey}, 3, function(t)
      if client.focus then
        client.focus:toggle_tag(t)
      end
    end),
    awful.button({}, 4, function(t) awful.tag.viewnext(t.screen) end),
    awful.button({}, 5, function(t) awful.tag.viewprev(t.screen) end)
  )
  panel.taglist = awful.widget.taglist {
    screen = scr,
    buttons = btn_tag,
    filter = awful.widget.taglist.filter.all,
    widget_template = {
      {
        {
          id = "text_role",
          widget = wibox.widget.textbox
        },
        left = 10,
        right = 10,
        widget = wibox.container.margin
      },
      id = "background_role",
      widget = wibox.container.background
    }
  }

  -- tasklist
  local btn_task = gears.table.join(
    awful.button({}, 1, function(c)
      if c == client.focus then
        c.minimized = true
      else
        c:emit_signal("request::activate", "tasklist", {raise = true})
      end
    end),
    awful.button({}, 4, function() awful.client.focus.byidx(1) end),
    awful.button({}, 5, function() awful.client.focus.byidx(-1) end)
  )
  panel.tasklist = awful.widget.tasklist {
    screen = scr,
    filter = awful.widget.tasklist.filter.currenttags,
    buttons = btn_task,
    layout   = {
      layout  = wibox.layout.fixed.horizontal
    },
    widget_template = {
      {
        {
          {
            id = 'text_role',
            widget = wibox.widget.textbox
          },
          left = 10,
          right = 10,
          bottom = 2,
          widget  = wibox.container.margin
        },
        id = 'background_role',
        widget = wibox.container.background,
      },
      top = 0,
      bottom = 0,
      widget  = wibox.container.margin
    },
  }

  --  widget
  --! FontAwesome icons

  panel.volume = require("widgets.ponymix")
  panel.battery = require("widgets.upower")
  panel.xbacklight = require("widgets.xbacklight")

  -- layouts
  panel.left = {
   panel.taglist, SP,
    layout = wibox.layout.fixed.horizontal
  }
  panel.middle = {
    panel.tasklist,
    layout = wibox.layout.align.horizontal
  }
  panel.right = {
    SP, wibox.widget.textclock("%I:%M %p"),
    layout = wibox.layout.fixed.horizontal
  }

  -- setup main wibar
  panel.main = awful.wibar {
    position = "top",
    screen = scr
  }
  panel.main:setup {
    {
      panel.left,
      panel.middle,
      panel.right,
      layout = wibox.layout.align.horizontal
    },
    left = 0,
    right = 20,
    widget = wibox.container.margin
  }
end)

-- dynamic wibar corner radius
local function wibar_shapemanager(c)
  panel.main.shape = function(cr, w, h)
    if c.fullscreen or c.maximized then
      gears.shape.partially_rounded_rect(cr, w, h, false, false, true, true, 0)
    else
      gears.shape.partially_rounded_rect(cr, w, h, false, false, true, true,
        beautiful.wibar_corner_radius or 10)
    end
  end
end

client.connect_signal("manage", function(c) wibar_shapemanager(c) end)
client.connect_signal("request::geometry", function(c) wibar_shapemanager(c) end)
client.connect_signal("request::activate", function(c) wibar_shapemanager(c) end)
screen.connect_signal("tag::history::update", function(c) wibar_shapemanager(c) end)

