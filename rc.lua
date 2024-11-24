pcall(require, "luarocks.loader")
local awful = require("awful")
local beautiful = require("beautiful") -- Theme handling library

require("awful.autofocus")

local vars = require("main.user-variable")
local config_path = vars.config_path

beautiful.init(config_path.."/theme.lua")
beautiful.maximized_hide_border = true

-- TODO: I really want to avoid those cryptic `require`s and actually showcase the skeleton of the default rc.lua

local layouts = require("main.layout")
awful.layout.layouts = layouts

require("main.tag")

require("main.rule")
require("main.error")

require("main.signal")
require("module.share_keyboard_layout")

local globalkeys = require("key.globalkey")
local globalbuttons = require("key.globalbuttons")

require("appearance.wibar")

-- Set keys
root.keys(globalkeys)
root.buttons(globalbuttons)

require("module.auto-start")

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
