local awful = require("awful")
-- local autostart = require('configuration.autostart')

local gfs = require("gears.filesystem")
local config_path = gfs.get_configuration_dir()

awful.spawn.once("env GLFW_IM_MODULE=ibus /home/robert/.local/kitty.app/bin/kitty", {})
awful.spawn.once("obsidian", {})
awful.spawn.once("firefox", {})
awful.spawn.once("krita", {})
awful.spawn.once("zathura", {})

-- Scripts
awful.spawn(config_path.."/script/amixer.sh")
awful.spawn(config_path.."/script/sensitivity.sh")

-- local function run_once(cmd)
--   local findme = cmd
--   local firstspace = cmd:find(' ')
--   if firstspace then
--     findme = cmd:sub(0, firstspace - 1)
--   end
--   awful.spawn.with_shell(string.format('pgrep -u $USER -x %s > /dev/null || (%s)', findme, cmd))
-- end
--
-- for _, app in ipairs(autostart.run_on_start_up) do
--   run_once(app)
-- end

