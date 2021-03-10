local wibox = require('wibox')
local awful = require('awful')

Hello = wibox {
   y = 200,
   x = 900,
   height = 400,
   visible = true,
   width = 400,
}

local hello = wibox.widget.textbox("Hello world")
local click = wibox.widget.textbox("Click Count ")
local number = wibox.widget.textbox(0)

local click_count =  wibox.widget {
   {
      click,
      number,
      layout = wibox.layout.fixed.horizontal
   },
   top = 10,
   widget = wibox.container.margin
}

local count = function()
   number.text = number.text + 1
end

number:buttons({
   awful.button({}, 1, function() count() end)
})

Hello : setup {
   {
      hello,
      {
         click_count,
         layout = wibox.container.place,
      },
      layout = wibox.layout.fixed.vertical
   },
   layout = wibox.container.place
}

