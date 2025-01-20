local awful = require("awful")
local gears = require("gears")
local vars = require("main.user_variable")

local modkey = vars.modkey
local altkey = vars.altkey


local tags = awful.screen.focused().tags

local tagkeys = {}

for i = 1, 9 do
	tagkeys = gears.table.join(tagkeys, -- appending, so that you don't loose keys from the previous iteration
	awful.key({ modkey }, "#" .. i + 9, function()
		local screen = awful.screen.focused()
		local tag = screen.tags[i]
		if tag then
			tag:view_only()
		end
		client.focus = awful.client.getmaster()
	end, {description = "view tag #" .. i, group = "numerated"}),

	awful.key({ modkey, "Shift" }, "#" .. i + 9, function()
		if client.focus then
			local tag = client.focus.screen.tags[i]
			if tag then
				client.focus:move_to_tag(tag)
			end
		end
	end, {description = "move to tag #"..i, group = "numerated"}),

	awful.key({ modkey, altkey }, "#" .. i + 9, function()
		if client.focus then
			local first_tag = client.focus.first_tag
			local tag = client.focus.screen.tags[i]
			if tag then
				client.focus:toggle_tag(tag)
			end

			--for k = 1, 9, 1 do
			--	if first_tag == tags[k] then
			--		if k < i then
			--			awful.client.setmaster(client.focus)
			--		else
			--			awful.client.setslave(client.focus)
			--		end
			--	end
			--end

		end
	end, {description = "toggle on tag #" .. i, group = "numerated"}),

	awful.key({ modkey, "Control" }, "#" .. i + 9, function()
		clients = awful.screen.focused().selected_tag:clients()
		clients[i]:jump_to()
	end, {description = "focus client #" .. i, group = "numerated"})
	)
end

return tagkeys
