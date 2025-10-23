local gears = require("gears")
local awful = require("awful")

local vars = require("main.user_variable")
local modkey = vars.modkey

local clientbuttons = gears.table.join(
	awful.button({ }, 1, function (c)
		c:activate { context = "mouse_click" }
	end),
	awful.button({ modkey }, 1, function (c)
		c:activate { context = "mouse_click", action = "mouse_move" }
	end),
	awful.button({ modkey }, 3, function (c)
		c:activate { context = "mouse_click", action = "mouse_resize"}
	end)
)

return clientbuttons
