local gears = require("gears")
local awful = require("awful")

local globalbuttons = gears.table.join(
	awful.button({ }, 4, awful.tag.viewprev),
	awful.button({ }, 5, awful.tag.viewnext)
)

return globalbuttons
