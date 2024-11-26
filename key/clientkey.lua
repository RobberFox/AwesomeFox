local awful = require("awful")
local gears = require("gears")

local vars = require("main.user_variable")
local modkey = vars.modkey

local clientkeys = gears.table.join(
-- Client layout manipulation
awful.key({ modkey, "Shift" }, "c", function(c) c:kill() end, {description = "close", group = "3 client"}),
awful.key({ modkey, "Control" }, "Return", function(c) c:swap(awful.client.getmaster()) end, {description = "move to master", group = "3 client"}),
awful.key({ modkey, }, "t", function(c) c.ontop = not c.ontop end, {description = "toggle keep on top", group = "3 client"}),
awful.key({ modkey, "Control" }, "space", awful.client.floating.toggle , {description = "toggle floating", group = "3 client"}),
awful.key({ modkey, }, "o", function(c) c:move_to_screen() end, {description = "move to screen", group = "3 client"}),

-- Maximization
awful.key({ modkey, }, "f", function(c)
	c.fullscreen = not c.fullscreen
	c:raise()
end, {description = "toggle fullscreen", group = "4 min/max"}),
awful.key({ modkey, }, "m", function(c)
	c.maximized = not c.maximized
	c:raise()
end , {description = "(un)maximize", group = "4 min/max"}),
awful.key({ modkey, "Control" }, "m", function(c)
	c.maximized_vertical = not c.maximized_vertical
	c:raise()
end , {description = "(un)maximize vertically", group = "4 min/max"}),
awful.key({ modkey, "Shift" }, "m", function(c)
	c.maximized_horizontal = not c.maximized_horizontal
	c:raise()
end , {description = "(un)maximize horizontally", group = "4 min/max"}),
awful.key({ modkey, }, "n", function(c)
	-- The client currently has the input focus, so it cannot be minimized, since minimized clients can't have the focus.
	c.minimized = true
end , {description = "minimize", group = "4 min/max"})
)

return clientkeys
