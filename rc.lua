pcall(require, "luarocks.loader")
local awful = require("awful")

local beautiful = require("beautiful") -- Theme handling library
beautiful.init("/home/robert/.config/awesome/theme.lua")
beautiful.maximized_hide_border = true

-- TODO: I really want to avoid those cryptic `require`s and actually showcase the skeleton of the default rc.lua

local vars = require("main.user-variable")

local layouts = require("main.layout")
awful.layout.layouts = layouts

require("main.tag")

require("main.rule")
require("main.error")

require("main.signal")
require("awful.autofocus")

local globalkeys = require("key.globalkey")
local globalbuttons = require("key.globalbuttons")

require("appearance.wibar")
require("modules.auto-start")

-- Set keys
root.keys(globalkeys)
root.buttons(globalbuttons)
