local awful = require("awful")

client.connect_signal("property::class", function(c)
	if c.class == "Spotify" then
		-- Move the Spotify instance to "music" tag on this screen
		local t = awful.tag.find_by_name(awful.screen.focused(), "8")
		c:move_to_tag(t)
	end
end)
