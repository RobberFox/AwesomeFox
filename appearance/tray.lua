local wibox = require("wibox")
local beautiful = require("beautiful")

local vars = require("main.user-variable")

-- System tray stuff
local dpi = vars.dpi
beautiful.systray_icon_spacing = dpi(4)

-- NOTE: Widgets library

local widgets = {}

function widgets.mytextclock(s)
	return wibox.widget {
		format = "%a %b %d > %H:%M ",

		widget = wibox.widget.textclock,
		screen = s,
	}
end

function widgets.mybrightness(s)
	local brightnesswidget = wibox.widget {
		widget = wibox.widget.textbox(),
		screen = s,
	}
	awesome.connect_signal("laptop::brightness", function(value)
		brightnesswidget.text = value
	end)

	return brightnesswidget
end


function widgets.myvolume(s)
	local volumewidget = wibox.widget {
		widget = wibox.widget.textbox(),
		screen = s,
	}
	awesome.connect_signal("laptop::volume", function(percentage, status)
		volumewidget.text = percentage.."-"..status.." "
	end)

	return volumewidget
end

function widgets.mybattery(s)
	return wibox.widget {

		widget = wibox.widget.textbox(),
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
