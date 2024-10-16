local awful = require("awful")
local gears = require("gears")

local vars = require("main.user-variable")

local modkey = vars.modkey
local altkey = vars.altkey

local tagkeys = {}

for i = 1, 9 do
	tagkeys = gears.table.join(tagkeys, -- appending, so that you don't loose keys from the previous iteration
	-- View tag only.
	awful.key({ modkey }, "#" .. i + 9, function()
		local screen = awful.screen.focused()
		local tag = screen.tags[i]
		if tag then
			tag:view_only()
		end
		client.focus = awful.client.getmaster()
	end, {description = "view tag #" .. i, group = "numerated"}),

	-- Toggle tag display.
	awful.key({ modkey, "Control" }, "#" .. i + 9, function()
		local screen = awful.screen.focused()
		local tag = screen.tags[i]
		if tag then
			awful.tag.viewtoggle(tag)
		end
	end, {description = "toggle tag #" .. i, group = "numerated"}),

	-- Move client to tag.
	awful.key({ modkey, "Shift" }, "#" .. i + 9, function()
		if client.focus then
			local tag = client.focus.screen.tags[i]
			if tag then
				client.focus:move_to_tag(tag)
			end
		end
	end, {description = "move focused client to tag #"..i, group = "numerated"}),

	-- Toggle tag on focused client.
	awful.key({ modkey, altkey }, "#" .. i + 9, function()
		if client.focus then
			local tag = client.focus.screen.tags[i]
			if tag then
				client.focus:toggle_tag(tag)
			end
		end
	end, {description = "toggle focused client on tag #" .. i, group = "numerated"})
	)
end

return tagkeys
