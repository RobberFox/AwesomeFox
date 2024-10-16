local awful = require("awful")

local names = { "1-Dev", "2-Obs", "3-Ffx", "4-Drw", "5-Pdf", "6", "7", "8", "9" }

-- ❶ 一 term", "❷ 二 net", "❸ 三 edit",
--      "❹ 四 place", "❺ 五 mail",
--      " ❻ 六", "❼ 七", " ❽ 八", "❾ 九" },

for key, name in ipairs(names) do
	awful.screen.connect_for_each_screen(function(s)
		if name == "1-Dev" then
			awful.tag.add(name, {
				layout = awful.layout.layouts[1],
				master_width_factor = 0.65,
				screen = s,
				selected = true,
			})
		elseif name == "3-Ffx" then
			awful.tag.add(name, {
				layout = awful.layout.layouts[1],
				master_width_factor = 0.5,
				screen = s,
			})
		else
			awful.tag.add(name, {
				layout = awful.layout.layouts[1],
				master_width_factor = 0.65,
				screen = s,
			})
		end
	end)
end
