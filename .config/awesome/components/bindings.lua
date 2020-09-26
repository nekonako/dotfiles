local awful = require("awful")
local gears = require("gears")
local hotkeys_popup = require("awful.hotkeys_popup")

require("awful.autofocus")
require("awful.hotkeys_popup.keys")

local self = {}
local Mod = "Mod4"

self.mouse = gears.table.join(
  awful.button({}, 3, function() conf.menu:toggle() end),
  awful.button({}, 4, awful.tag.viewnext),
  awful.button({}, 5, awful.tag.viewprev)
)

self.keys = gears.table.join(
  awful.key({Mod}, "s", hotkeys_popup.show_help, {description = "show help", group = "awesome"}),
  awful.key({Mod}, "Left",function() awful.client.focus.byidx(1) end, {description = "focus next by index", group = "client"} ),
  awful.key({Mod}, "Right", function() awful.client.focus.byidx(-1) end, {description = "focus previous by index", group = "client"} ), 
  awful.key({Mod}, "Escape", awful.tag.history.restore, {description = "go back", group = "tag"}),
  awful.key({Mod}, "j", awful.tag.viewprev, {description = "view previous", group = "tag"}),
  awful.key({Mod}, "k", awful.tag.viewnext, {description = "view next", group = "tag"}),
  awful.key({Mod}, "w", function() conf.menu:show() end, {description = "show main menu", group = "awesome"} ),
  awful.key({Mod, "Shift"}, "j", function() awful.client.swap.byidx(1) end, {description = "swap with next client by index", group = "client"} ),
  awful.key({Mod, "Shift"}, "k", function() awful.client.swap.byidx(-1) end, {description = "swap with previous client by index", group = "client"} ),
  awful.key({Mod, "Control"}, "j", function() awful.screen.focus_relative(1) end, {description = "focus the next screen", group = "screen"} ),
  awful.key({Mod, "Control"}, "k", function() awful.screen.focus_relative(-1) end, {description = "focus the previous screen", group = "screen"} ),
  awful.key({Mod}, "u", awful.client.urgent.jumpto, {description = "jump to urgent client", group = "client"}),
  awful.key({Mod}, "Tab", function() awful.client.focus.history.previous() if client.focus then client.focus:raise() end end, {description = "go back", group = "client"} ),
  awful.key({Mod}, "Return", function() awful.spawn(conf.app.term) end, {description = "open a terminal", group = "launcher"} ),
  awful.key({Mod, "Control"}, "r", awesome.restart, {description = "reload awesome", group = "awesome"}),
  awful.key({Mod, "Shift"}, "q", function() awful.spawn(conf.app.logout, false) end, {description = "quit awesome", group = "awesome"}),
  awful.key({Mod}, "l", function() awful.tag.incmwfact(0.05) end, {description = "increase master width factor", group = "layout"} ),
  awful.key({Mod}, "h", function() awful.tag.incmwfact(-0.05) end, {description = "decrease master width factor", group = "layout"} ),
  awful.key({Mod, "Shift"}, "h", function() awful.tag.incnmaster(1, nil, true) end, {description = "increase the number of master clients", group = "layout"} ),
  awful.key({Mod, "Shift"}, "l", function() awful.tag.incnmaster(-1, nil, true) end, {description = "decrease the number of master clients", group = "layout"} ),
  awful.key({Mod, "Control"}, "h", function() awful.tag.incncol(1, nil, true) end, {description = "increase the number of columns", group = "layout"} ),
  awful.key({Mod, "Control"}, "l", function() awful.tag.incncol(-1, nil, true) end, {description = "decrease the number of columns", group = "layout"} ),
  awful.key({Mod}, "space", function() awful.layout.inc(1) end, {description = "select next", group = "layout"} ),
  awful.key({Mod, "Shift"}, "space", function() awful.layout.inc(-1) end, {description = "select previous", group = "layout"} ),
  awful.key({Mod, "Control"}, "n", function() local c = awful.client.restore() if c then c:emit_signal("request::activate", "key.unminimize", {raise = true}) end end, {description = "restore minimized", group = "client"} ),
  awful.key({Mod}, "p", function() awful.spawn(conf.app.launcher, false) end, {description = "open launcher", group = "launcher"} ),
  awful.key({Mod, "Mod1"}, "l", function() awful.spawn(conf.app.screenshot, false) end, {description = "Screenshot", group = "launcher"} ),
  awful.key({Mod, "Shift"}, "f", function() awful.spawn(conf.app.filemanager, false) end, {description = "Filemanager", group = "client"} )
)

self.clientkeys = gears.table.join(
  awful.key({Mod}, "F11", function(c) c.fullscreen = not c.fullscreen c:raise() end, {description = "toggle fullscreen", group = "client"} ),
  awful.key({Mod}, "q", function(c) c:kill() end, {description = "close", group = "client"} ),
  awful.key({Mod, "Control"}, "space", awful.client.floating.toggle, {description = "toggle floating", group = "client"} ),
  awful.key({Mod, "Control"}, "Return", function(c) c:swap(awful.client.getmaster()) end, {description = "move to master", group = "client"} ),
  awful.key({Mod}, "o", function(c) c:move_to_screen() end, {description = "move to screen", group = "client"} ),
  awful.key({Mod}, "t", function(c) c.ontop = not c.ontop end, {description = "toggle keep on top", group = "client"} ),
  awful.key({Mod}, "n", function(c) c.minimized = true end, {description = "minimize", group = "client"} ),
  awful.key({Mod}, "m", function(c) c.maximized = not c.maximized c:raise() end, {description = "(un)maximize", group = "client"} ),
  awful.key({Mod, "Control"}, "m", function(c) c.maximized_vertical = not c.maximized_vertical c:raise() end, {description = "(un)maximize vertically", group = "client"} ),
  awful.key({Mod, "Shift"}, "m", function(c) c.maximized_horizontal = not c.maximized_horizontal c:raise() end, {description = "(un)maximize horizontally", group = "client"} ),
  awful.key({Mod, "Control" }, "t", awful.titlebar.toggle, {description = "Toggle title bar", group = "Clients"})
)
for i = 1, 9 do
  self.keys = gears.table.join(
    self.keys,
    awful.key({Mod}, "#" .. i + 9, function() local screen = awful.screen.focused() local tag = screen.tags[i] if tag then tag:view_only() end end, {description = "view tag #" .. i, group = "tag"} ), -- Toggle tag display.
    awful.key({Mod, "Control"}, "#" .. i + 9, function() local screen = awful.screen.focused() local tag = screen.tags[i] if tag then awful.tag.viewtoggle(tag) end end, {description = "toggle tag #" .. i, group = "tag"} ), -- Move client to tag.
    awful.key({Mod, "Shift"}, "#" .. i + 9, function() if client.focus then local tag = client.focus.screen.tags[i] if tag then client.focus:move_to_tag(tag) end end end, {description = "move focused client to tag #" .. i, group = "tag"} ), -- Toggle tag on focused client.
    awful.key({Mod, "Control", "Shift"}, "#" .. i + 9, function() if client.focus then local tag = client.focus.screen.tags[i] if tag then client.focus:toggle_tag(tag) end end end, {description = "toggle focused client on tag #" .. i, group = "tag"} )
  )
end

self.clientbuttons = gears.table.join(
  awful.button({}, 1, function(c) c:emit_signal("request::activate", "mouse_click", {raise = true}) end),
  awful.button({Mod}, 1, function(c) c:emit_signal("request::activate", "mouse_click", {raise = true}) awful.mouse.client.move(c) end),
  awful.button({Mod}, 3, function(c) c:emit_signal("request::activate", "mouse_click", {raise = true}) awful.mouse.client.resize(c) end),
  awful.button({"Mod3"}, 1, function(c) c:emit_signal("request::activate", "mouse_click", {raise = true}) awful.mouse.client.move(c) end),
  awful.button({"Mod3"}, 3, function(c) c:emit_signal("request::activate", "mouse_click", {raise = true}) awful.mouse.client.resize(c) end)
)

-- media button
local function volume(method)
  awful.spawn.easy_async("ponymix "..method.." 5 --max-volume 150", function()
  package.loaded["widgets.ponymix"]:update()
  end)
end
local function brightness(method)
  awful.spawn.easy_async("light -"..method.." 5", function()
    package.loaded["widgets.xbacklight"]:update()
  end)
end

self.keys = gears.table.join(
  self.keys,
  -- Volume
  awful.key({}, "XF86AudioRaiseVolume",
    function() volume("increase") end,
    {description = "increase volume", group = "media"} ),
  awful.key({}, "XF86AudioLowerVolume",
    function() volume("decrease") end,
    {description = "decrease volume", group = "media"} ),
  -- Brightness
  awful.key({}, "XF86MonBrightnessUp",
    function() brightness("A,") end,
    {description = "increase brightness", group = "media"} ),
  awful.key({}, "XF86MonBrightnessDown",
    function() brightness("U") end,
    {description = "decrease brightness", group = "media"} )
)

return self
