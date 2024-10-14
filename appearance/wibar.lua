local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")

require("awful.autofocus")

local beautiful = require("beautiful")
local dpi = RC.vars.dpi
beautiful.systray_icon_spacing = dpi(4)

awesome.set_preferred_icon_size (64)

local appearance = { -- Wrapping in as a "library", prevents pollution
	wallpaper = require("appearance.wallpaper"),
	taglist = require("appearance.taglist"),
	tasklist = require("appearance.tasklist"),
	tray = require("appearance.tray"),
}

local taglist_buttons = appearance.taglist
local tasklist_buttons = appearance.tasklist

awful.screen.connect_for_each_screen(function(s)
	set_wallpaper(s)

	s.mytaglist = awful.widget.taglist {
		screen = s,
		filter = awful.widget.taglist.filter.all,
		buttons = taglist_buttons,
	}

	s.mypromptbox = awful.widget.prompt()

	s.mytasklist = awful.widget.tasklist {
		screen = s,
		filter = awful.widget.tasklist.filter.currenttags,
		buttons = tasklist_buttons,
	}

	s.mylayouticon = awful.widget.layoutbox(s)
	s.mylayouticon:buttons(gears.table.join(
	awful.button({ }, 1, function () awful.layout.inc( 1) end),
	awful.button({ }, 3, function () awful.layout.inc(-1) end),
	awful.button({ }, 4, function () awful.layout.inc( 1) end),
	awful.button({ }, 5, function () awful.layout.inc(-1) end)
	))

	-- s.mybattery = appearance.tray[1]
	-- s.mytextclock = appearance.tray[2]
	-- s.mytray = appearance.tray[3]

	-- Create the wibox
	s.mywibox = awful.wibar({ position = "top", screen = s, height = 24 })

	-- Add widgets to the wibox
	s.mywibox:setup {
		layout = wibox.layout.align.horizontal, -- don't confuse with windows layout

		{ -- Left widgets
			layout = wibox.layout.fixed.horizontal,

			s.mytaglist,
			s.mypromptbox,
		},

		s.mytasklist, -- Middle widget

		{ -- Right widgets
			layout = wibox.layout.fixed.horizontal,

			-- s.mytray,
			-- s.mybattery,
			-- s.mytextclock,
			s.mylayouticon,
		},
	}
end)
