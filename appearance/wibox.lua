local awful = require("awful")
local wibox = require("wibox")

local appearance = { -- my library
	set_wallpaper = require("appearance.wallpaper"),
	mytaglist = require("appearance.taglist"),
	mytasklist = require("appearance.tasklist"),
	mytraywidgets = require("appearance.tray"),
	mypadding = require("appearance.padding"),
	mypopup = require("appearance.layout_popup")
}

awful.screen.connect_for_each_screen(function(s)
	appearance.set_wallpaper(s)

	s.mypromptbox = awful.widget.prompt(s)
	s.mylayoutbox = awful.widget.layoutbox(s)

	s.mypopup = appearance.mypopup

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

			--wibox.container.margin(wibox.widget {
			--	image  = "/home/robert/dotsFox/AwesomeFox/image/keyboard.png",
			--	resize = true,
			--	widget = wibox.widget.imagebox
			--}, 2, 2, 2, 2),
			appearance.mytraywidgets.mykeyboardlayout(s),
			appearance.mytraywidgets.mybrightness(s),
			--wibox.container.margin(wibox.widget {
			--	image  = "/home/robert/dotsFox/AwesomeFox/image/speaker.png",
			--	resize = true,
			--	widget = wibox.widget.imagebox
			--}, 2, 2, 2, 2),
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
