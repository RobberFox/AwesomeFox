local wibox = require("wibox")
local awful = require("awful")
local beautiful = require("beautiful")

local vars = require("main.user-variable")

-- NOTE: Functions for displaying information
local function battery()
	local info, file

	file = io.popen("acpi -b | cut -d ',' -f 2")
	info = file:read("*all")
	file:close()

	return " "..info.." "
end

-- System tray stuff
local dpi = vars.dpi
beautiful.systray_icon_spacing = dpi(4)

awful.screen.connect_for_each_screen(function(s)
	s.mytextclock = wibox.widget {
		format = " %a %b %d > %H:%M ",
		font =  "jetbrainsmono bold 12",

		widget = wibox.widget.textclock,
		screen = s,
	}

	s.mybattery = wibox.widget {
		text = battery(),

		widget = wibox.widget.textbox,
		screen = s,
	}

	s.mysystray = wibox.widget.systray()
	s.mylayoutbox = awful.widget.layoutbox(s)
end)
