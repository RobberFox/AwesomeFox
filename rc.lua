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

local globalkeys = require("key.globalkey")
local globalbuttons = require("key.globalbuttons")

require("appearance.wibar")

-- Set keys
root.keys(globalkeys)
root.buttons(globalbuttons)

require("module.auto-start")

--local naughty = require("naughty")
--awesome.connect_signal("laptop::brightness", function(value)
--	naughty.notify({ title = "Brightness check:", text = stdout, timeout = 3 })
--end)
