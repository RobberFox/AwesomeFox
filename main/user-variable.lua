local gears = require("gears")
local beautiful = require("beautiful")

local _M = {
	config_path = gears.filesystem.get_configuration_dir(),
	themes_path = gears.filesystem.get_themes_dir(),

	dpi = beautiful.xresources.apply_dpi,

	terminal = "kitty",

	modkey = "Mod4",
	altkey = "Mod1",
}

return _M
