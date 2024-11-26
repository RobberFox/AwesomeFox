local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")

local function layout_print()
	local keyboard_layouts = { "us", "ru", "am" }
	local colors = { beautiful.red, beautiful.green, beautiful.green }
	local layout_index = 1 + awesome.xkb_get_layout_group()

	return { keyboard_layouts[layout_index], colors[layout_index] }
end

local mypopup = awful.popup {
	widget = {
		{
			{
				id = "kbdtext",
				font = "jetbrainsmono bold 16",
				text = "us",
				align = "center",
				widget = wibox.widget.textbox,
				forced_width = 80,
			},
			id = "kbdbackground",
			fg = beautiful.black,
			widget = wibox.container.background,
		},
		layout = wibox.layout.fixed.horizontal,
	},
	bg = beautiful.red,

	placement = awful.placement.bottom,
	-- offset = { y = -10 },
	shape = gears.shape.rectangle,

	visible = true,
	ontop = true,
}

awful.widget.keyboardlayout():connect_signal("widget::layout_changed", function()
	mypopup.widget:get_children_by_id("kbdtext")[1].text = layout_print()[1]
	mypopup.widget:get_children_by_id("kbdbackground")[1].bg = layout_print()[2]
end)

return mypopup
