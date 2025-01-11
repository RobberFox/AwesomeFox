local awful = require("awful")

local names = { "1-Dev", "2-Obs", "3-Ffx", "4-Drw", "5-Pdf", "6", "7", "8", "9" }

local tags = awful.screen.focused().selected_tags

for _, name in ipairs(names) do
	awful.screen.connect_for_each_screen(function(s)
		if name == "1-Dev" then
			awful.tag.add(name, {
				layout = awful.layout.layouts[1],
				column_count = 3,
				master_width_factor = 0.65,
				screen = s,
				selected = true,
			})
		elseif name == "3-Ffx" then
			awful.tag.add(name, {
				layout = awful.layout.layouts[1],
				column_count = 3,
				master_width_factor = 0.5,
				screen = s,
			})
		else
			awful.tag.add(name, {
				layout = awful.layout.layouts[1],
				column_count = 3,
				master_width_factor = 0.65,
				screen = s,
			})
		end
	end)
end


