local awful = require("awful")
local naughty = require("naughty")

-- NOTE: API info that I prolly need
-- request::activate
-- client.focus
-- client.unfocus

-- local c = client.unfocus
-- if c then
-- 	awful.spawn.easy_async_with_shell("xkb-switch", function(stdout)
-- 		c.keyboard_layout = stdout
-- 	end)
-- end
-- if client.focus == c then
-- 	awful.spawn.with_shell("xkb-switch --switch "..c.keyboard_layout)
-- end

-- naughty.notify({ title = "Clients:", text = "ligma", timeout = 3 })
