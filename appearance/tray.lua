local wibox = require("wibox")
local beautiful = require("beautiful")

local vars = require("main.user_variable")
local awful = require("awful")
local gears = require("gears")

-- NOTE: Some sysinfo
gears.timer {
    timeout   = 60,
    call_now  = true,
    autostart = true,
    callback  = function()
		awful.spawn.easy_async_with_shell("acpi", function(stdout)
				value = string.match(stdout, "%d+%%")
			if (value ~= nil or value ~= '') then
				awesome.emit_signal("laptop::battery", value)
			end
		end)
    end
}

-- System tray stuff
local dpi = vars.dpi
beautiful.systray_icon_spacing = dpi(4)

-- NOTE: Widgets library

local widgets = {}

function widgets.mykeyboardlayout(s)
	local keyboardwidget = wibox.widget {
		widget = awful.widget.keyboardlayout(),
		screen = s,
	}

	local keyboardwiboxwidget = wibox.widget({
		fg = beautiful.red,
		keyboardwidget,
		widget = wibox.container.background
	})

	awful.widget.keyboardlayout():connect_signal("widget::layout_changed", function()
		if awesome.xkb_get_layout_group() == 0 then
			keyboardwiboxwidget.fg = beautiful.red
		else
			keyboardwiboxwidget.fg = beautiful.green
		end
	end)

	return keyboardwiboxwidget
end

function widgets.mytextclock(s)
	return wibox.widget {
		format = beautiful.html_white .. "%a %b %d" .. "</span>" .. beautiful.html_gray .. " > " .. "</span>" .. beautiful.html_white .. "%H:%M " .. "</span>",
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

	return wibox.widget({
		brightnesswidget,
		fg = beautiful.cyan,
		widget = wibox.container.background
	})
end


function widgets.myvolume(s)
	local volumewidget = wibox.widget {
		widget = wibox.widget.textbox(),
		screen = s,
	}
	awesome.connect_signal("laptop::volume", function(percentage, status)
		volumewidget.text = status.."-"..percentage.." "
	end)

	return wibox.widget({
		volumewidget,
		fg = beautiful.border_focus,
		widget = wibox.container.background
	})
end

function widgets.mybattery(s)
	local batterywidget = wibox.widget {
		widget = wibox.widget.textbox(),
		screen = s,
	}
	awesome.connect_signal("laptop::battery", function(percentage)
		if percentage ~= nil then
			batterywidget.text = percentage.." "
		end
	end)

	return wibox.widget {
		batterywidget,
		fg = beautiful.yellow,
		widget = wibox.container.background
	}
end

function widgets.mysystray(s)
	return wibox.widget {

		widget = wibox.widget.systray,
		screen = s,
	}
end

return widgets
