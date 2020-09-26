local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
return {
  items = {
    {"Launcher", function()
	awful.spawn(conf.app.launcher, false)
end},
    {"Thunar", conf.app.filemanager},
    {"Terminal", conf.app.term},
    {"Text editor", conf.app.editor},
    {"Music", conf.app.music},
    {"Firefox", conf.app.browser},
    {"restart", awesome.restart},
    {"logout", conf.app.logout},
     {"hotkeys",function()
      hotkeys_popup.show_help(nil, awful.screen.focused())
    end},
  }
}
