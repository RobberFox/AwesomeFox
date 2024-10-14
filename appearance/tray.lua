local wibox = require("wibox")


local function battery()
	local info, file

	file = io.popen("acpi -b | cut -d ',' -f 2")
	info = file:read("*all")
	file:close()

	return " " .. info .. " "
end

local _M = {
	mytextclock = wibox.widget {
		format = " %a %b %d > %H:%M ",
		widget = wibox.widget.textclock,
		font =  "jetbrainsmono bold 12"
	},

	mybattery = wibox.widget {
		text = battery(),
		widget = wibox.widget.textbox,
	},

	mytray = wibox.widget {
		widget = wibox.widget.systray(),
	}
}

return _M
