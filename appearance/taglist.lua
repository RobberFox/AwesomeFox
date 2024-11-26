local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")

local theme = require("theme")

local vars = require("main.user_variable")
local modkey = vars.modkey
local dpi = vars.dpi

-- Generate taglist squares:
local taglist_square_size = dpi(4)
beautiful.taglist_squares_sel = beautiful.theme_assets.taglist_squares_sel(taglist_square_size, theme.fg_normal)
beautiful.taglist_squares_unsel = beautiful.theme_assets.taglist_squares_unsel(taglist_square_size, theme.fg_normal)

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

-- local widget_template_taglist = {
-- 	{
-- 		{
-- 			{
-- 				bg = theme.fg_normal,
-- 				fg = theme.bg_normal,
-- 				shape = gears.shape.circle,
-- 				widget = wibox.container.background,
-- 				{
-- 					margins = 4,
-- 					widget  = wibox.container.margin,
-- 					{
-- 						id     = 'index_role',
-- 						widget = wibox.widget.textbox,
-- 					},
-- 				},
-- 			},
-- 			{
-- 				id     = 'text_role',
-- 				widget = wibox.widget.textbox,
-- 			},
-- 			layout = wibox.layout.fixed.horizontal,
-- 		},
-- 		widget = wibox.container.margin
-- 	},
-- 	id     = 'background_role',
-- 	widget = wibox.container.background,
--
-- 	create_callback = function(self, c3, index, objects) --luacheck: no unused args
-- 		self:get_children_by_id('index_role')[1].markup = '<b> '..index..' </b>'
-- 	end,
-- 	update_callback = function(self, c3, index, objects) --luacheck: no unused args
-- 		self:get_children_by_id('index_role')[1].markup = '<b> '..index..' </b>'
-- 	end,
-- }


local function taglist(s)
	return awful.widget.taglist {
		screen = s,
		filter = awful.widget.taglist.filter.all,
		buttons = taglist_buttons,
	}
end

return taglist
