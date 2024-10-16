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

-- NOTE: Widgets library

local widgets = {}

function widgets.mytextclock(s)
	return wibox.widget {
		format = " %a %b %d > %H:%M ",
		font =  "jetbrainsmono bold 12",

		widget = wibox.widget.textclock,
		screen = s,
	}
end

function widgets.mybattery(s)
	return wibox.widget {
		text = battery(),

		widget = wibox.widget.textbox,
		screen = s,
	}
end

function widgets.mysystray(s)
	return wibox.widget {

		widget = wibox.widget.systray,
		screen = s,
	}
end

return widgets
