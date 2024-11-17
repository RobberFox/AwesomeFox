local awful = require("awful")
local wibox = require("wibox")

local appearance = { -- my library
	set_wallpaper = require("appearance.wallpaper"),
	mytaglist = require("appearance.taglist"),
	mytasklist = require("appearance.tasklist"),
	mytraywidgets = require("appearance.tray"),
	mypadding = require("appearance.padding"),
}

awful.screen.connect_for_each_screen(function(s)
	appearance.set_wallpaper(s)

	s.mypromptbox = awful.widget.prompt(s)
	s.mylayoutbox = awful.widget.layoutbox(s)

	s.mywibox = awful.wibar({ position = "top", screen = s, height = 24 })

	s.mywibox:setup {
		layout = wibox.layout.align.horizontal, -- it's not the windows layout, it's the wibox layout!

		{ -- Left widgets
			layout = wibox.layout.fixed.horizontal,

			appearance.mytaglist(s),
			s.mypromptbox,
		},

		appearance.mytasklist(s), -- Middle widget
		--appearance.mypadding,

		{ -- Right widgets
			layout = wibox.layout.fixed.horizontal,

			appearance.mytraywidgets.mybrightness(s),
			appearance.mytraywidgets.myvolume(s),
			appearance.mytraywidgets.mybattery(s),
			appearance.mytraywidgets.mytextclock(s),
			wibox.container.margin(appearance.mytraywidgets.mysystray(s), 2, 2, 2, 2),
			s.mylayoutbox,
		},
	}
end)

-- Other way of going through screens:
-- for s in screen do
-- 	s.mywibox.visible = not s.mywibox.visible
-- end
