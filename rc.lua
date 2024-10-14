pcall(require, "luarocks.loader")

local awful = require("awful")
local gears = require("gears")

local beautiful = require("beautiful") -- Theme handling library

local wibox = require("wibox") -- Widget and layout library
local naughty = require("naughty") -- Notification library
local menubar = require("menubar") -- Misc library

-- NOTE: Calling of modules, setting up variables

RC = {} -- global namespace (created before `require` of modules), prevents pollution
RC.vars = require("main.user-variable")
modkey = RC.vars.modkey

require("main.error")
require("appearance.wibar")
-- require("module.auto-start")

beautiful.init(gears.filesystem.get_configuration_dir() .. ".config/awesome/theme.lua")
beautiful.wallpaper = RC.vars.wallpapaper
-- beautiful.maximized_hide_border = true

local main = {
	layouts = require("main.layout"),
	tags = require("main.tag"),
	rule = require("main.rule"),
}

local binding = {
	globalkeys = require("key.globalkey"),
	clientkeys = require("key.clientkey"),
	bindtotags = require("key.bindtag"),
}

-- NOTE: SKELETON OF THE CONFIG

RC.layouts = main.layouts
RC.tags = main.tags

RC.globalkeys = binding.globalkeys[1]
RC.globalkeys = binding.bindtotags(RC.globalkeys) -- do I need metatables here?

root.keys(RC.globalkeys)

awful.rules.rules = main.rule(
binding.clientkeys
)

require("main.signal")
