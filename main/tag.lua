local awful = require("awful")

local tagger = function(names, screen, layout)
	awful.tag(names, screen, layout)
end

local names = { "1-Dev", "2-Obs", "3-Ffx", "4-Drw", "5-Pdf", "6", "7", "8", "9" }

awful.screen.connect_for_each_screen(function(s)
	tagger(names, s, awful.layout.layouts[1])
end)
