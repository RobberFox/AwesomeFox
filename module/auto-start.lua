local awful = require("awful")
local vars = require("main.user-variable")

local config_path = vars.config_path
local home_path = vars.home_path

-- Try to use combination of `.once` or `.with_shell` and see what sticks
awful.spawn.once("env GLFW_IM_MODULE=ibus "..home_path.."/.local/kitty.app/bin/kitty", {})
awful.spawn.with_shell("pidof obsidian || obsidian") -- because obsidian is an exception
awful.spawn.once("firefox", {})
awful.spawn.once("krita", {})
awful.spawn.once("zathura", {})

-- Scripts
awful.spawn(config_path.."/script/amixer.sh")
awful.spawn(config_path.."/script/sensitivity.sh")
