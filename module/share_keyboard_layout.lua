local awful = require("awful")

client.connect_signal("unfocus", function(c)
	awful.spawn.easy_async_with_shell("xkb-switch", function(stdout)
		if c.valid then -- To avoid 'Invalid Object' error
			c.keyboard_layout = stdout
		end
	end)
end)

client.connect_signal("focus", function(c)
	if c.keyboard_layout == nil then
		c.keyboard_layout = "us(altgr-intl)"
	end
	awful.spawn("xkb-switch -s "..c.keyboard_layout, false) -- `false` to prevent cursor being stuck in 'loading' state
end)
