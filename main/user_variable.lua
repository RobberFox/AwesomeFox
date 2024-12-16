local gears = require("gears")
local beautiful = require("beautiful")

local _M = {
	config_path = gears.filesystem.get_configuration_dir(),
	themes_path = gears.filesystem.get_themes_dir(),
	home_path = os.getenv("HOME"),

	dpi = beautiful.xresources.apply_dpi,

	defaut_layout = "us(intl-unicode)",

	terminal = "kitty",
	editor = "nvim",

	modkey = "Mod4",
	altkey = "Mod1",
}

return _M
