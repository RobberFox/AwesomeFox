local awful = require("awful")
local gears = require("gears")

awesome.set_preferred_icon_size (64)

local tasklist_buttons = gears.table.join(
awful.button({ }, 1, function (c)
	if c == client.focus then
		c.minimized = true
	else
		c:emit_signal(
		"request::activate",
		"tasklist",
		{ raise = true }
		)
	end
end),
awful.button({ }, 3, function() awful.menu.client_list({ theme = { width = 250 } }) end),
awful.button({ }, 4, function () awful.client.focus.byidx(1) end),
awful.button({ }, 5, function () awful.client.focus.byidx(-1) end)
)

local function tasklist(s)
	return awful.widget.tasklist {
		filter = awful.widget.tasklist.filter.currenttags,
		buttons = tasklist_buttons,

		screen = s,
	}
end

return tasklist
