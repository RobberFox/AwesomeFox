local naughty = require("naughty")

-- Error handling
if awesome.startup_errors then
	naughty.notify({ preset = naughty.config.presets.critical,
	title = "STARTUP ERRORS:",
	text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
	local in_error = false
	awesome.connect_signal("debug::error", function (err)
		-- Make sure we don't go into an endless error loop
		if in_error then return end
		in_error = true

		naughty.notify({ preset = naughty.config.presets.critical,
		title = "ERRORS:",
		text = tostring(err) })
		in_error = false
	end)
end
