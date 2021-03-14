local apps = require('utils.apps')
local awful = require('awful')
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")
local menu = require('components.djancoeg.menu')
local dashboard = require('components.djancoeg.dashboard')
local logout = require('components.djancoeg.logout')

Mod = 'Mod4'

-- Appclications keybindings --
awful.keyboard.append_global_keybindings({
   awful.key(
      { Mod }, 'l',
      function() awful.spawn(apps.screenshoot) end,
      {
         description = "Take Screenshoot",
         group = "launcher"
      }
   ),
   awful.key(
      { Mod }, "Return",
      function() awful.spawn(apps.terminal) end,
      {
         description = "Open a terminal",
         group = "launcher"
      }
   ),
   awful.key(
      { Mod }, 'o',
      function() awful.spawn(apps.launcher) end,
      {
         description = "Open launcher app",
         group = 'launcher'
      }
   ),
   awful.key(
      { Mod }, 'f',
      function() awful.spawn(apps.file_manager) end,
      {
         description = "Open launcher app",
         group = 'launcher'
      }
   ),
})

-- Workspaces keybindings --
awful.keyboard.append_global_keybindings({
   awful.key(
      { Mod }, 'k',
      awful.tag.viewnext,
      {
         description = 'Go to next workspace',
         group = 'Tag'
      }
   ),
   awful.key(
      { Mod }, 'j',
      awful.tag.viewprev,
      {
         description = 'Go to previous workspace',
         group = 'Tag'
      }
   ),
   awful.key(
      { Mod }, 'Backspace',
      awful.tag.history.restore,
      {
         description = 'Go to back workspace',
         group = 'Tag'
      }
   ),
   awful.key {
      modifiers   = { Mod },
      keygroup    = "numrow",
      description = "only view tag",
      group       = "tag",
      on_press    = function (index)
         local screen = awful.screen.focused()
         local tag = screen.tags[index]
         if tag then
            tag:view_only()
         end
      end,
   },
   awful.key {
      modifiers   = { Mod, "Control" },
      keygroup    = "numrow",
      description = "toggle tag",
      group       = "tag",
      on_press    = function (index)
         local screen = awful.screen.focused()
         local tag = screen.tags[index]
         if tag then
            awful.tag.viewtoggle(tag)
         end
      end,
   },
   awful.key {
      modifiers = { Mod, "Shift" },
      keygroup    = "numrow",
      description = "move focused client to tag",
      group       = "tag",
      on_press    = function (index)
         if client.focus then
            local tag = client.focus.screen.tags[index]
            if tag then
               client.focus:move_to_tag(tag)
            end
         end
      end,
   },
   awful.key {
      modifiers   = { Mod, "Control", "Shift" },
      keygroup    = "numrow",
      description = "toggle focused client on tag",
      group       = "tag",
      on_press    = function (index)
         if client.focus then
            local tag = client.focus.screen.tags[index]
            if tag then
               client.focus:toggle_tag(tag)
            end
         end
      end,
   },
   awful.key {
      modifiers   = { Mod },
      keygroup    = "numpad",
      description = "select layout directly",
      group       = "layout",
      on_press    = function (index)
         local t = awful.screen.focused().selected_tag
         if t then
            t.layout = t.layouts[index] or t.layout
         end
      end,
   }
})

-- Window keybindings --
awful.keyboard.append_global_keybindings({
   awful.key(
      { Mod, 'Shift' }, 'k',
      function() awful.client.focus.byidx(1) end,
      {
         description = 'Gp to next window',
         group = 'client'
      }
   ),
   awful.key(
      { Mod, 'Shift' }, 'j',
      function() awful.client.focus.byidx(-1) end,
      {
         description = 'Gp to prev window',
         group = 'client'
      }
   )
})

client.connect_signal("request::default_keybindings", function()

   -- Full screen
   awful.keyboard.append_client_keybindings({
      awful.key({ Mod, "Shift" }, "f",
         function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
         end,
         {
            description = "toggle fullscreen",
            group = "client"
         }
      ),

      -- Close window
      awful.key(
         { Mod, "Shift" }, "q",
         function (c) c:kill() end,
         {
            description = "close",
            group = "client"
         }
      ),
      -- Float toggle
      awful.key(
         { Mod, "Shift" }, "space",
         awful.client.floating.toggle                     ,
         {
            description = "toggle floating",
            group = "client"
         }
      ),

      -- get master window
      awful.key(
         { Mod, "Control" }, "Return",
         function (c) c:swap(awful.client.getmaster()) end,
         {
            description = "move to master",
            group = "client"
         }
      ),
      -- Move to screen
      awful.key(
         { Mod, "Shift" }, "o",
         function (c) c:move_to_screen() end,
         {
            description = "move to screen",
            group = "client"
         }
      ),
      -- stciky top
      awful.key(
         { Mod }, "t",
         function (c) c.ontop = not c.ontop  end,
         {
            description = "toggle keep on top",
            group = "client"
         }
      ),
      -- Minimize
      awful.key(
         { Mod }, "n",
         function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
         end ,
         {
            description = "minimize",
            group = "client"
         }
      ),
      -- maximize
      awful.key(
         { Mod }, "m",
         function (c)
            c.maximized = not c.maximized
            c:raise()
         end ,
         {
            description = "(un)maximize",
            group = "client"
         }
      ),
      -- maximize vertically
      awful.key(
         { Mod, "Control" }, "m",
         function (c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
         end ,
         {
            description = "(un)maximize vertically",
            group = "client"
         }
      ),
      -- maximize horizontally
      awful.key(
         { Mod, "Shift" }, "m",
         function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
         end ,
         {
            description = "(un)maximize horizontally",
            group = "client"
         }
      ),
   })
end)


--- Layout keybindings ---
awful.keyboard.append_global_keybindings({
   awful.key(
      { Mod, 'Control' }, "space",
      function () awful.layout.inc(-1) end,
      {
         description = "select next",
         group = "layout"
      }
   ),
   awful.key(
      { Mod, "Mod1" }, "space",
      function () awful.layout.inc(1) end,
      {
         description = "select previous",
         group = "layout"
      }
   ),

   awful.key(
      { Mod, 'Control'}, "u",
      awful.client.urgent.jumpto,
      {
         description = "jump to urgent client",
         group = "client"
      }
   ),
   awful.key(
      { Mod, 'Control' }, "l",
      function () awful.tag.incmwfact( 0.05)  end,
      {
         description = "increase master width factor",
         group = "layout"
      }
   ),
   awful.key(
      { Mod, "Control"}, "h",
      function () awful.tag.incmwfact(-0.05) end,
      {
         description = "decrease master width factor",
         group = "layout"
      }
   ),
   awful.key(
      { Mod }, "{",
      function () awful.tag.incnmaster( 1, nil, true) end,
      {
         description = "increase the number of master clients",
         group = "layout"
      }
   ),
   awful.key(
      { Mod }, "}",
      function () awful.tag.incnmaster(-1, nil, true) end,
      {
         description = "decrease the number of master clients",
         group = "layout"
      }
   ),
})

-- Utility keybindings --
awful.keyboard.append_global_keybindings({
   awful.key(
      { Mod }, "h",
      hotkeys_popup.show_help,
      {
         description="show help",
         group="awesome",
      }
   ),
   awful.key(
      { Mod }, "w",
      function () menu:show() end,
      {
         description = "show main menu",
         group = "awesome"
      }
   ),
   awful.key(
      { Mod, "Control" }, "r",
      awesome.restart,
      {
         description = "reload awesome",
         group = "awesome"
      }
   ),
   awful.key(
      { Mod, "Shift" }, "Escape",
      awesome.quit,
      {
         description = "quit awesome",
         group = "awesome"
      }
   ),
   awful.key(
      { Mod }, "x",
      function ()
         awful.prompt.run {
            prompt       = "Run Lua code: ",
            textbox      = awful.screen.focused().mypromptbox.widget,
            exe_callback = awful.util.eval,
            history_path = awful.util.get_cache_dir() .. "/history_eval"
         }
      end,
      {
         description = "lua execute prompt",
         group = "awesome"
      }
   ),
   awful.key({Mod}, 'c', function()
      if dashboard.visible == false then
         dashboard.visible = true
      else
         dashboard.visible = false
      end
   end, { description = 'toggle dashboard', group = 'awesome' }
   ),
   awful.key({Mod, 'Shift'}, 'p', function()
      if logout.visible == false then
         logout.visible = true
      else
         logout.visible = false
      end
   end, { description = 'toggle logout', group = 'awesome' }
   ),
})
-- media
local function volume(method)
awful.spawn("ponymix "..method.." 5 --max-volume 150")
end
local function brightness(method)
awful.spawn("light -"..method.." 5")
end

awful.keyboard.append_client_keybindings({
   awful.key(
      {}, "XF86AudioRaiseVolume",
      function() volume("increase") end,
      {
         description = "increase volume",
         group = "media"
      }
   ),
   awful.key(
      {}, "XF86AudioLowerVolume",
      function() volume("decrease") end,
      {
         description = "decrease volume",
         group = "media"
      }
   ),
   -- Brightness
   awful.key(
      {}, "XF86MonBrightnessUp",
      function() brightness("A,") end,
      {
         description = "increase brightness",
         group = "media"
      }
   ),
   awful.key(
      {}, "XF86MonBrightnessDown",
      function() brightness("U") end,
      {
         description = "decrease brightness",
         group = "media"
      }
   )
})

-- Mouse binding
client.connect_signal("request::default_mousebindings", function()
   awful.mouse.append_client_mousebindings({
      awful.button({ }, 1, function (c)
         c:activate { context = "mouse_click" }
      end),
      awful.button({ Mod }, 1, function (c)
         c:activate { context = "mouse_click", action = "mouse_move"  }
      end),
      awful.button({ Mod, "Shift" }, 1, function (c)
         c:activate { context = "mouse_click", action = "mouse_resize"}
      end),
   })
end)
