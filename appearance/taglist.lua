local awful = require("awful")
local gears = require("gears")

local vars = require("main.user-variable")
local modkey = vars.modkey

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
awful.button({ }, 1, function(t) t:view_only() end),
awful.button({ modkey }, 1, function(t)
	if client.focus then
		client.focus:move_to_tag(t)
	end
end),
awful.button({ }, 3, awful.tag.viewtoggle),
awful.button({ modkey }, 3, function(t)
	if client.focus then
		client.focus:toggle_tag(t)
	end
end),
awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
)

local function taglist(s)
	return awful.widget.taglist {
		filter = awful.widget.taglist.filter.all,
		buttons = taglist_buttons,

		screen = s,
	}
end

return taglist
