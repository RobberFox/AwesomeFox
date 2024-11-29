pcall(require, "luarocks.loader")
local awful = require("awful")
local beautiful = require("beautiful")

require("awful.autofocus")

-- Theme
local vars = require("main.user_variable")
local config_path = vars.config_path

beautiful.init(config_path.."/theme.lua")
beautiful.maximized_hide_border = true

-- ### Skeleton of the default rc.lua config ### --
require("main.error")

local layouts = require("main.layout")
local rules = require("main.rule")

-- Order matters: it should follow that of the default rc.lua config
awful.layout.layouts = layouts
require("main.tag")
awful.rules.rules = rules

require("appearance.wibox")

-- Set keys
local globalkeys = require("key.globalkey")
local globalbuttons = require("key.globalbuttons")

root.keys(globalkeys)
root.buttons(globalbuttons)

require("main.signal")
require("module.share_keyboard_layout")
-- require("module.apprules")

-- Autostarting of apps always comes last
require("module.autostart")

-- Misc. debugging stuff
-- function dump(o)
-- 	if type(o) == 'table' then
-- 		local s = '{ '
-- 		for k,v in pairs(o) do
-- 			if type(k) ~= 'number' then k = '"'..k..'"' end
-- 			s = s .. '['..k..'] = ' .. dump(v) .. ','
-- 		end
-- 		return s .. '} '
-- 	else
-- 		return tostring(o)
-- 	end
-- end

-- naughty.notify({ title = "Layout:", text = c.keyboard_layout, timeout = 10 })
-- naughty.notify({ title = "Fake Layout:", text = stdout, timeout = 10 })
