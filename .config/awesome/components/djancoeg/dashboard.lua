local wibox = require('wibox')
local dpi = require("beautiful.xresources").apply_dpi
local color = require("beautiful.xresources").get_current_theme()
local awful = require('awful')
local beautiful = require('beautiful')
local gears = require('gears')
local icon = require('utils.icon')
local hdd = require('widget.hdd')

local home = os.getenv('HOME')

local shape = function (cr, w, h)
   gears.shape.rounded_rect(cr, w, h, 10)
end

local shape2 = function (cr, w, h)
   gears.shape.partially_rounded_rect(cr, w, h, true, false, true, true, 18)
end

local box_radius = shape
local box_gap = dpi(6)

local dashboard = wibox {
   visible = false,
   ontop = true,
   bg = beautiful.bg_normal .. 'AA',
   type = 'dock',
}

awful.placement.maximize(dashboard)

local function dashboard_visibility()
   if dashboard.visible == true then
      dashboard.visible = false
   else
      dashboard.visible = true
   end
end

-- right click to hide dashboard
dashboard:buttons(gears.table.join(
   awful.button({ }, 3, function ()
      dashboard_visibility()
   end)
))

local function create_box(widget, width, height, bg)
   local container = wibox.container.background()
   container.bg = bg
   container.forced_height = height
   container.forced_width = width
   container.shape = box_radius
   local box_widget = wibox.widget {
      -- gap between box
      {
         -- container
         {
            -- center horizontal
            nil,
            {
               --  center vertical
               nil,
               widget,
               layout = wibox.layout.align.vertical,
               expand = "none"
            },
            layout = wibox.layout.align.horizontal,
            expand = "none"
         },
         widget = container,
      },
      margins = box_gap,
      widget = wibox.container.margin
   }
   return box_widget
end

local profile = wibox.widget {
   {
      {
         image = home .. '/.config/awesome/nako.png',
         widget = wibox.widget.imagebox,
      },
      shape = shape2,
      bg = color.background,
      forced_height = dpi(300),
      forced_width = dpi(300),
      widget = wibox.container.background(),
   },
   margins = box_gap,
   widget = wibox.container.margin
}

local hours = wibox.widget {
   {
      valign = 'center',
      align = 'center',
      font = 'PragmataPro bold 50',
      format = '%H',
      widget = wibox.widget.textclock,
   },
   fg = color.color2,
   widget = wibox.container.background
}

local spa = wibox.widget {
   {
      {
         text = '   ',
         font = 'PragmataPro 15',
         widget = wibox.widget.textbox
      },
      direction = 'west',
      layout = wibox.container.rotate
   },
   fg = color.color1,
   widget = wibox.container.background
}

local minute = wibox.widget {
   {
      valign = 'center',
      align = 'center',
      font = 'PragmataPro bold 50',
      format = '%M',
      widget = wibox.widget.textclock,
   },
   fg = color.color2,
   widget = wibox.container.background
}

local clock = wibox.widget {
   hours,
   spa,
   minute,
   spacing = dpi(15),
   layout = wibox.layout.fixed.horizontal
}


-- CPU
local cpu_icon = wibox.widget {
   {
      font = 'PragmataPro 30',
      text = icon.gylph.heart,
      widget = wibox.widget.textbox
   },
   fg = color.color1,
   widget = wibox.container.background
}
local cpu_bar = wibox.widget {
   {
      max_value     = dpi(100),
      value         =  dpi(30),
      forced_height = dpi(50),
      forced_width  = dpi(300),
      border_width  = 0,
      margins       = {
         top = dpi(8),
         bottom = dpi(8),
      },
      background_color = color.color0,
      bar_shape        = gears.shape.rounded_bar,
      color = color.color1,
      border_color = color.background,
      shape         = gears.shape.rounded_bar,
      widget        = wibox.widget.progressbar,
   },
   layout = wibox.layout.stack
}
local cpu = wibox.widget {
   nil,
   {
      cpu_icon,
      cpu_bar,
      layout = wibox.layout.fixed.horizontal
   },
   expand = "none",
   layout = wibox.layout.align.horizontal
}


-- RAM
local ram_icon = wibox.widget {
   {
      font = 'PragmataPro 30',
      text = icon.gylph.cpu,
      widget = wibox.widget.textbox
   },
   fg = color.color3,
   widget = wibox.container.background
}
local ram_bar = wibox.widget {
   {
      max_value     = dpi(4000),
      value         =  dpi(2100),
      forced_height = dpi(50),
      forced_width  = dpi(300),
      bar_shape        = gears.shape.rounded_bar,
      border_width  = 0,
      margins       = {
         top = dpi(8),
         bottom = dpi(8),
      },
      background_color = color.color0,
      color = color.color3,
      border_color = color.background,
      shape         = gears.shape.rounded_bar,
      widget        = wibox.widget.progressbar,
   },
   layout = wibox.layout.stack
}
local ram = wibox.widget {
   nil,
   {
      ram_icon,
      ram_bar,
      layout = wibox.layout.fixed.horizontal
   },
   expand = "none",
   layout = wibox.layout.align.horizontal
}

-- Volume
local volume_icon = wibox.widget {
   {
      font = 'PragmataPro 30',
      text = icon.gylph.volume,
      widget = wibox.widget.textbox
   },
   fg = color.color4,
   widget = wibox.container.background
}
local volume_bar = wibox.widget {
   {
      max_value     = dpi(100),
      value         =  dpi(70),
      forced_height = dpi(50),
      forced_width  = dpi(300),
      border_width  = 0,
      margins       = {
         top = dpi(8),
         bottom = dpi(8),
      },
      bar_shape        = gears.shape.rounded_bar,
      background_color = color.color0,
      color = color.color4,
      border_color = color.background,
      shape         = gears.shape.rounded_bar,
      widget        = wibox.widget.progressbar,
   },
   layout = wibox.layout.stack
}
local volume = wibox.widget {
   nil,
   {
      volume_icon,
      volume_bar,
      layout = wibox.layout.fixed.horizontal
   },
   expand = "none",
   layout = wibox.layout.align.horizontal
}

local middle_top_box = wibox.widget {
   nil,
   {
      {
         volume,
         cpu,
         ram,
         spacing = dpi(10),
         layout = wibox.layout.fixed.vertical
      },
      margins = dpi(50),
      layout = wibox.container.margin
   },
   nil,
   expand = 'none',
   layout = wibox.layout.align.vertical
}
local clock_box = create_box(clock, 300, 300, beautiful.bg_normal)
local progress_box = create_box(middle_top_box, 400, 290, beautiful.bg_normal)


local styles = {}
styles.month   = { padding      = 20,
   fg_color     = color.foreground,
   bg_color     = color.background.."00",
   border_width = 0,
}
styles.normal  = {}
styles.focus   = { fg_color = color.color1,
   bg_color = color.color5..00,
   markup   = function(t) return '<b>' .. t .. '</b>' end,
}
styles.header  = { fg_color = color.color4,
   bg_color = color.color1.."00",
   -- markup   = function(t) return '<b>' .. t .. '</b>' end,
   markup   = function(t) return '<span font_desc="pragmatapro bold 25">' .. t .. '</span>' end,
}
styles.weekday = { fg_color = color.color6,
   bg_color = color.color1.."00",
   padding  = 3,
   markup   = function(t) return '<b>' .. t .. '</b>' end,
}
local function decorate_cell(widget, flag, date)
   if flag=='monthheader' and not styles.monthheader then
      flag = 'header'
   end
   local props = styles[flag] or {}
   if props.markup and widget.get_text and widget.set_markup then
      widget:set_markup(props.markup(widget:get_text()))
   end
   -- Change bg color for weekends
   local d = {year=date.year, month=(date.month or 1), day=(date.day or 1)}
   local weekday = tonumber(os.date('%w', os.time(d)))
   local default_fg = color.foreground
   local default_bg = color.color0.."00"
   -- local default_bg = (weekday==0 or weekday==6) and x.color6 or x.color14
   local ret = wibox.widget {
      {
         widget,
         margins = (props.padding or 2) + (props.border_width or 0),
         widget  = wibox.container.margin
      },
      shape              = props.shape,
      shape_border_color = props.border_color or color.background,
      shape_border_width = props.border_width or 0,
      fg                 = props.fg_color or default_fg,
      bg                 = props.bg_color or default_bg,
      widget             = wibox.container.background
   }
   return ret
end


local calendar_widget = wibox.widget {
   date     = os.date('*t'),
   font     = "PragmataPro bold 13",
   long_weekdays = false,
   spacing  = dpi(10),
   fn_embed = decorate_cell,
   widget   = wibox.widget.calendar.month
}

local calendar = create_box(calendar_widget, 200, 400, beautiful.bg_normal)


local mpc = function()
   local c = io.popen('mpc current')
   local b = c:read('*l')
   return tostring(b)
end

local mpd_song = wibox.widget {
   {
      text = mpc(),
      font = 'PragmataPro bold 15',
      widget = wibox.widget.textbox
   },
   fg = color.color4,
   widget = wibox.container.background
}

local mpd_box = create_box(mpd_song, 100, 100, beautiful.bg_normal)

local disk_arc = wibox.widget {
   start_angle = 3 * math.pi / 2,
   min_value = 0,
   max_value = 100,
   value = 75,
   border_width = 0,
   thickness = dpi(20),
   forced_width = dpi(120),
   forced_height = dpi(120),
   rounded_edge = true,
   bg = color.color8.."55",
   colors = { color.color13 },
   widget = wibox.container.arcchart
}

local disk_icon = wibox.widget {
   {
      align = "center",
      valign = "center",
      text = icon.gylph.storage,
      font = 'PragmataPro 25',
      widget = wibox.widget.textbox()
   },
   fg = color.color6,
   widget = wibox.container.background
}

local disk = wibox.widget {
   {
      expand = "none",
      layout = wibox.layout.align.vertical
   },
   disk_icon,
   disk_arc,
   top_only = false,
   layout = wibox.layout.stack
}

local disk_box = create_box(disk, 200, 200, beautiful.bg_normal)

local jancok = wibox.widget {
   {
      {
         text = 'ꦗꦤ꧀ꦕꦺꦴꦏ꧀',
         font = 'PragmataPro bold 50',
         widget = wibox.widget.textbox,
      },
      fg = color.color6,
      widget = wibox.container.background,
   },
   direction = 'west',
   layout = wibox.container.rotate
}

local jancok_widget = create_box(jancok, 200, 500, beautiful.bg_normal)

dashboard:setup {
   nil,
   {
      nil,
      {
         {
            profile,
            calendar,
            layout = wibox.layout.fixed.vertical
         },
         {
            clock_box,
            progress_box,
            mpd_box,
            layout = wibox.layout.fixed.vertical
         },
         {
            disk_box,
            jancok_widget,
            layout = wibox.layout.fixed.vertical
         },
         layout = wibox.layout.fixed.horizontal
      },
      nil,
      expand = "none",
      layout = wibox.layout.align.horizontal
   },
   expand = "none",
   layout = wibox.layout.align.vertical

}

return dashboard
