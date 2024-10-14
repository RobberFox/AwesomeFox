local awful = require("awful")

names = { "1-Dev", "2-Obs", "3-Ffx", "4-Drw", "5-Pdf", "6", "7", "8", "9" }
tags = {}

local _M = {
	awful.screen.connect_for_each_screen(function(s)
		tags[s] = awful.tag(names, s, RC.layouts)
	end)
}

return _M
