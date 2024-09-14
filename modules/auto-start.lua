local awful = require("awful")
-- local autostart = require('configuration.autostart')

awful.util.spawn("kitty")
awful.util.spawn("obsidian")
awful.util.spawn("firefox")
awful.util.spawn("krita")
awful.util.spawn("zathura")

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

