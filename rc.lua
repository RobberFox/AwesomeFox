pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")

local beautiful = require("beautiful") -- Theme handling library

local wibox = require("wibox") -- Widget and layout library
local naughty = require("naughty") -- Notification library
local menubar = require("menubar") -- Misc library

RC = {} -- global namespace (created before `require` of modules)
RC.vars = require("main.user-variable")
-- modkey = RC.vars.modkeys

require("main.error")
require("appearance.wibar")
require("main.signal")
require("module.auto-start")

beautiful.init(gears.filesystem.get_configuration_dir() .. ".config/awesome/theme.lua")
beautiful.wallpaper = RC.vars.wallpapaper
-- beautiful.maximized_hide_border = true

-- Custom local library
local main = {
	layouts = require("main.layout"),
	tags = require("main.tag"),
	rule = require("main.rule"),
}

-- Custom local library: keybindings
local binding = {
	globalkeys = require("key.global"),
	generalkeys = require("key.general"),
}



-- NOTE: SKELETON OF THE CONFIG

RC.layouts = main.layouts()
RC.tags = main.tags()

RC.globalkeys = binding.globalkeys

