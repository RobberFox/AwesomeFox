local awful = require("awful")
local naughty = require("naughty")

-- NOTE: API info that I prolly need
-- request::activate
-- client.focus
-- https://awesomewm.org/apidoc/utility_libraries/gears.object.html#gears.object

-- client.connect_signal("unfocus", function(c)
-- 	awful.spawn.easy_async_with_shell("xkb-switch", function(stdout)
-- 		c.keyboard_layout = stdout
-- 	end)
-- end)
-- 
-- client.connect_signal("focus", function(c)
-- 	if c.keyboard_layout == nil then
-- 		c.keyboard_layout = "us(altgr-intl)"
-- 	end
-- 	awful.spawn.with_shell("xkb-switch -s "..c.keyboard_layout)
-- 	awesome.emit_signal("keyboard::layout", awesome.xkb_get_layout_group())
-- end)

	-- function dump(o)
	-- 	if type(o) == 'table' then
	-- 		local s = '{ '
	-- 		for k,v in pairs(o) do
	-- 			if type(k) ~= 'number' then k = '"'..k..'"' end
	-- 			s = s .. '['..k..'] = ' .. dump(v) .. ','
	-- 		end
	-- 		return s .. '} '
	-- 	else
	-- 		return tostring(o)
	-- 	end
	-- end

	-- naughty.notify({ title = "Clients:", text = dump(c), timeout = 10 })
	-- naughty.notify({ title = "Layout", text = c.keyboard_layout, timeout = 3 })
