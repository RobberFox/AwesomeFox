local awful = require("awful")
-- local autostart = require('configuration.autostart')

awful.spawn.once("env GLFW_IM_MODULE=ibus /home/robert/.local/kitty.app/bin/kitty", { rule = { name = "kitty" }, properties = { screen = 1, fullscreen = false, tag = "1-Dev" } })
awful.spawn.once("obsidian", { rule = { instance = "obsidian" }, properties = { screen = 1, fullscreen = false, tag = "2-Obs" } })
awful.spawn.once("firefox", { rule = { class = "Firefox" }, properties = { screen = 1, fullscreen = false, tag = "3-Ffx" } })
awful.spawn.once("krita", { rule = { class = "krita" }, properties = { screen = 1, fullscreen = false, tag = "4-Drw" } })
awful.spawn.once("zathura", { rule = { name = "zathura" }, properties = { screen = 1, fullscreen = false, tag = "5-Pdf" } })

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

