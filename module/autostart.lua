local awful = require("awful")
local vars = require("main.user_variable")

local config_path = vars.config_path
-- local home_path = vars.home_path

-- Try to use combination of `.once` or `.with_shell` and see what sticks
--awful.spawn.with_shell("pidof kitty || kitty", false)
--awful.spawn.with_shell("pidof kitty || env GLFW_IM_MODULE=ibus "..home_path.."/.local/kitty.app/bin/kitty", false)
awful.spawn.with_shell("pidof obsidian || obsidian --disable-smooth-scrolling", false) -- because obsidian is an exception
awful.spawn.with_shell("pidof krita || krita", false)
awful.spawn.with_shell("pidof zathura || zathura", false)

awful.spawn.once("kitty", { screen = 1, urgent = false, maximized = false, tag = "1-Dev" })
awful.spawn.once("firefox", { screen = 1, urgent = false, maximized = false, tag = "3-Ffx" })
--awful.spawn.once("obsidian --disable-smooth-scrolling", { screen = 1, urgent = false, maximized = false, tag = "2-Obs" })
--awful.spawn.once("firefox-esr", { screen = 1, urgent = false, maximized = false, tag = "3-Ffx" })
--awful.spawn.once("krita", { screen = 1, urgent = false, maximized = false, tag = "4-Drw" })
--awful.spawn.once("zathura", { screen = 1, urgent = false, maximized = false, tag = "5-Pdf" })

-- Scripts
awful.spawn.once(config_path.."script/set_xkb_layout.sh")
awful.spawn.once(config_path.."script/amixer.sh")
awful.spawn.once(config_path.."script/sensitivity.sh")
awful.spawn.once(config_path.."script/screen.sh")
