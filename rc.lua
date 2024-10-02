-- If LuaRocks is installed, make sure that packages installed through it are found (e.g. lgi)
pcall(require, "luarocks.loader")
-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
-- Widget and layout library
local wibox = require("wibox")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
-- local hotkeys_popup = require("awful.hotkeys_popup")

-- require("awful.autofocus")
-- require("awful.hotkeys_popup.keys")

local beautiful = require("beautiful") -- Theme handling library
beautiful.init("/home/robert/.config/awesome/theme.lua")
beautiful.maximized_hide_border = true


require("configuration.layout")
require("configuration.rule")
require("configuration.key")
require("configuration.signal")

require("modules.wibar")
require("modules.menu")
require("modules.auto-start")

-- Error handling
if awesome.startup_errors then
	naughty.notify({ preset = naughty.config.presets.critical,
	title = "Oops, there were errors during startup!",
	text = awesome.startup_errors })
end
-- Handle runtime errors after startup
do
	local in_error = false
	awesome.connect_signal("debug::error", function (err)
		-- Make sure we don't go into an endless error loop
		if in_error then return end
		in_error = true

		naughty.notify({ preset = naughty.config.presets.critical,
		title = "Oops, an error happened!",
		text = tostring(err) })
		in_error = false
	end)
end
