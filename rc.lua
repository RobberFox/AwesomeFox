pcall(require, "luarocks.loader")
local gears = require("gears")
local awful = require("awful")

require("awful.autofocus")

local wibox = require("wibox")
local beautiful = require("beautiful")
local ruled = require("ruled")

-- Theme
local vars = require("main.user_variable")
local config_path = vars.config_path

beautiful.init(config_path.."/theme.lua")
beautiful.maximized_hide_border = true

-- ### Skeleton of the default rc.lua config ### --
require("main.error")

local layouts = require("main.layout")
tag.connect_signal("request::default_layouts", function()
	awful.layout.append_default_layouts(layouts)
end)

require("main.tag")

-- Ricing
require("appearance.wallpaper")
require("appearance.wibox")

-- Keybindings
local globalbuttons = require("key.globalbutton")
local globalkeys = require("key.globalkey")

awful.keyboard.append_global_keybindings({ globalkeys })
awful.mouse.append_global_mousebindings({ globalbuttons })

local clientbuttons = require("key.clientbutton")
local clientkeys = require("key.clientkey")

client.connect_signal("request::default_mousebindings", function()
	awful.mouse.append_client_mousebindings({ clientbuttons })
end)
client.connect_signal("request::default_keybindings", function()
	awful.keyboard.append_client_keybindings({ clientkeys })
end)

-- Unsorted
local rules = require("main.rules")
ruled.client.connect_signal("request::rules", function()
	for _, rule in ipairs(rules) do
		ruled.client.append_rule(rule)
	end
end)

require("main.notification")
require("module.apprules")
require("module.share_keyboard_layout")

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
