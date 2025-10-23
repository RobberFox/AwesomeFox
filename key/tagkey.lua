local gears = require("gears")
local awful = require("awful")

local vars = require("main.user_variable")
local modkey = vars.modkey
local altkey = vars.altkey

local tagkeys = gears.table.join(
	awful.key {
		modifiers = { modkey },
		keygroup = "numrow",
		description = "only view tag",
		group = "tag",
		on_press = function (index)
			local screen = awful.screen.focused()
			local tag = screen.tags[index]
			if tag then
				tag:view_only()
			end
		end,
	},
	awful.key {
		modifiers = { modkey, "Shift" },
		keygroup = "numrow",
		description = "move focused client to tag",
		group = "tag",
		on_press = function (index)
			if client.focus then
				local tag = client.focus.screen.tags[index]
				if tag then
					client.focus:move_to_tag(tag)
				end
			end
		end,
	},
	awful.key {
		modifiers = { modkey, altkey },
		keygroup = "numrow",
		description = "toggle focused client on tag",
		group = "tag",
		on_press = function (index)
			if client.focus then
				local tag = client.focus.screen.tags[index]
				if tag then
					client.focus:toggle_tag(tag)
				end
			end
		end,
	},
	awful.key {
		modifiers = { modkey },
		keygroup = "numpad",
		description = "select layout directly",
		group = "layout",
		on_press = function (index)
			local t = awful.screen.focused().selected_tag
			if t then
				t.layout = t.layouts[index] or t.layout
			end
		end,
	},

	-- Tags related keybindings
	awful.key({ modkey, }, "Left", awful.tag.viewprev, {description = "view previous", group = "tag"}),
	awful.key({ modkey, }, "Right", awful.tag.viewnext, {description = "view next", group = "tag"}),
	awful.key({ modkey, }, "Escape", function()
		awful.tag.history.restore()
		client.focus = awful.client.getmaster()
	end, {description = "go back", group = "tag"})
)

return tagkeys
