local wibox = require('wibox')
local awful = require('awful')

local hello_world = wibox {
   height = 500,
   width = 500,
   ontop = true,
   visible = false
}

local text_hello_world = {
   text = 'Hello world',
   align = 'center',
   font = 'Iosevka Mayukai 30',
   widget = wibox.widget.textbox
}

local number = wibox.widget {
   text = 1,
   align = 'center',
   font = 'Iosevka Mayukai 20',
   widget = wibox.widget.textbox
}

local function increment()
   number.text = number.text + 1
end

number:buttons(awful.button({}, 1, function() increment() end))

hello_world : setup {
   nil,
   {
      text_hello_world,
      number,
      spacing = 20,
      layout = wibox.layout.fixed.vertical
   },
   nil,
   expand = "none",
   layout = wibox.layout.align.vertical
}

local function hello_world_visibility()
   if hello_world.visible == false then
      hello_world.visible = true
   else
      hello_world.visible = false
   end
end

awful.keyboard.append_global_keybindings({
   awful.key({ "Mod4" }, "y", function() hello_world_visibility() end)
})

return hello_world
