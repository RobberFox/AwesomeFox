local awful = require("awful")
local beautiful = require("beautiful")

beautiful.master_width_factor = 0.65

local function tagger(names, screen, layout)
	awful.tag(names, screen, layout)
end

local names = { "1-Dev", "2-Obs", "3-Ffx", "4-Drw", "5-Pdf", "6", "7", "8", "9" }

awful.screen.connect_for_each_screen(function(s)
	tagger(names, s, awful.layout.layouts[1])
end)

-- local function tagger(name, screen, layout)
-- 	awful.tag.add(name, {
-- 		layout             = layout,
-- 		master_fill_policy = "master_width_factor",
-- 		gap_single_client  = true,
-- 		gap                = 15,
-- 		screen             = s,
-- 		selected           = true,
-- 	})
-- end
