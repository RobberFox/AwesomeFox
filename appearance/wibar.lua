local awful = require("awful")
local wibox = require("wibox")

require("appearance.taglist")
require("appearance.tasklist")
require("appearance.tray")

set_wallpaper = require("appearance.wallpaper")

awful.screen.connect_for_each_screen(function(s)
	set_wallpaper(s)

	s.mypromptbox = awful.widget.prompt(s)

	s.mywibox = awful.wibar({ position = "top", screen = s, height = 24 })

	s.mywibox:setup {
		layout = wibox.layout.align.horizontal, -- it's not the windows layout, it's the wibox layout!

		{ -- Left widgets
			layout = wibox.layout.fixed.horizontal,

			s.mytaglist,
			s.mypromptbox,
		},

		s.mytasklist, -- Middle widget

		{ -- Right widgets
			layout = wibox.layout.fixed.horizontal,

			s.mybattery,
			wibox.container.margin(s.mysystray, 2, 2, 2, 2),
			s.mytextclock,
			s.mylayoutbox,
		},
	}
end)
