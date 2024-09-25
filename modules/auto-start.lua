local awful = require("awful")
-- local autostart = require('configuration.autostart')

awful.spawn.once("env GLFW_IM_MODULE=ibus /home/robert/.local/kitty.app/bin/kitty", {})
awful.spawn.once("/usr/bin/obsidian", {})
awful.spawn.once("firefox", {})
awful.spawn.once("krita", {})
awful.spawn.once("zathura", {})

awful.spawn("/home/robert/script/amixer.sh")

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

