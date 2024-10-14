local awful = require("awful")
local gears = require("gears")
local menubar = require("menubar")

require("modules.menu") -- for `terminal = "kitty"` variable
require('awful.autofocus')
local hotkeys_popup = require('awful.hotkeys_popup').widget

modkey = "Mod4"
altkey = "Mod1"

local config_path = gears.filesystem.get_configuration_dir()

clientkeys = gears.table.join(
awful.key({ modkey, }, "f", function (c) c.fullscreen = not c.fullscreen c:raise() end, {description = "toggle fullscreen", group = "client"}),
awful.key({ modkey, "Shift" }, "c", function (c) c:kill() end, {description = "close", group = "client"}),
awful.key({ modkey, "Control" }, "space", awful.client.floating.toggle , {description = "toggle floating", group = "client"}),
awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end, {description = "move to master", group = "client"}),
awful.key({ modkey, }, "o", function (c) c:move_to_screen() end, {description = "move to screen", group = "client"}),
awful.key({ modkey, }, "t", function (c) c.ontop = not c.ontop end, {description = "toggle keep on top", group = "client"}),
awful.key({ modkey, }, "n", function (c)
	-- The client currently has the input focus, so it cannot be
	-- minimized, since minimized clients can't have the focus.
	c.minimized = true
end , {description = "minimize", group = "client"}),
awful.key({ modkey, }, "m", function (c)
	c.maximized = not c.maximized
	c:raise()
end , {description = "(un)maximize", group = "client"}),
awful.key({ modkey, "Control" }, "m", function (c)
	c.maximized_vertical = not c.maximized_vertical
	c:raise()
end , {description = "(un)maximize vertically", group = "client"}),
awful.key({ modkey, "Shift" }, "m", function (c)
	c.maximized_horizontal = not c.maximized_horizontal
	c:raise()
end , {description = "(un)maximize horizontally", group = "client"})
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
	globalkeys = gears.table.join(globalkeys, -- appending new keys
	-- View tag only.
	awful.key({ modkey }, "#" .. i + 9, function ()
		local screen = awful.screen.focused()
		local tag = screen.tags[i]
		if tag then
			tag:view_only()
			client.focus = awful.client.getmaster()
		end
	end, {description = "view tag #"..i, group = "tag"}),
	-- Toggle tag display.
	awful.key({ modkey, "Control" }, "#" .. i + 9, function ()
		local screen = awful.screen.focused()
		local tag = screen.tags[i]
		if tag then
			awful.tag.viewtoggle(tag)
		end
	end, {description = "toggle tag #" .. i, group = "tag"}),
	-- Move client to tag.
	awful.key({ modkey, "Shift" }, "#" .. i + 9, function ()
		if client.focus then
			local tag = client.focus.screen.tags[i]
			if tag then
				client.focus:move_to_tag(tag)
			end
		end
	end, {description = "move focused client to tag #"..i, group = "tag"}),
	-- Toggle tag on focused client.
	awful.key({ modkey, altkey }, "#" .. i + 9, function ()
		if client.focus then
			local tag = client.focus.screen.tags[i]
			if tag then
				client.focus:toggle_tag(tag)
			end
		end
	end, {description = "toggle focused client on tag #" .. i, group = "tag"})
	)
end

-- Set keys
root.keys(globalkeys)
