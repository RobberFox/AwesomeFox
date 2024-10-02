require("configuration.key")
require("configuration.layout")

local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
local wibox = require("wibox")
local beautiful = require("beautiful")

awesome.set_preferred_icon_size (64)

-- Create a textclock widget
mytextclock = wibox.widget {
	format = " %a %b %d > %H:%M ",
	widget = wibox.widget.textclock,
	font =  "jetbrainsmono bold 12"
}
-- Battery widget

local function battery()
	local info, file

	file = io.popen("acpi -b | cut -d ',' -f 2")
	info = file:read("*all")
	file:close()

	return " " .. info .. " "
end

gears.timer {
    timeout   = 60,
    call_now  = true,
    autostart = true,
    callback  = function()
    end
}

mybattery = wibox.widget {
	text = battery(),
	widget = wibox.widget.textbox,
}

-- System tray
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
beautiful.systray_icon_spacing = dpi(4)

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
awful.button({ }, 1, function(t) t:view_only() end),
awful.button({ modkey }, 1, function(t)
	if client.focus then
		client.focus:move_to_tag(t)
	end
end),
awful.button({ }, 3, awful.tag.viewtoggle),
awful.button({ modkey }, 3, function(t)
	if client.focus then
		client.focus:toggle_tag(t)
	end
end),
awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
)

local tasklist_buttons = gears.table.join(
awful.button({ }, 1, function (c)
	if c == client.focus then
		c.minimized = true
	else
		c:emit_signal(
		"request::activate",
		"tasklist",
		{ raise = true }
		)
	end
end),
awful.button({ }, 3, function()
	awful.menu.client_list({ theme = { width = 250 } })
end),
awful.button({ }, 4, function ()
	awful.client.focus.byidx(1)
end),
awful.button({ }, 5, function ()
	awful.client.focus.byidx(-1)
end))

local function set_wallpaper(s)
	-- Wallpaper
	if beautiful.wallpaper then
		local wallpaper = beautiful.wallpaper
		-- If wallpaper is a function, call it with the screen
		if type(wallpaper) == "function" then
			wallpaper = wallpaper(s)
		end
		gears.wallpaper.maximized(wallpaper, s, true)
	end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

mykeyboardlayout = awful.widget.keyboardlayout()

awful.screen.connect_for_each_screen(function(s)
	set_wallpaper(s)

	-- Each screen has its own tag table.
	local names = { "1-Dev", "2-Obs", "3-Ffx", "4-Drw", "5-Pdf", "6", "7", "8", "9" }
	awful.tag(names, s, awful.layout.layouts[1])

	-- Create a promptbox for each screen
	s.mypromptbox = awful.widget.prompt()
	-- Create an imagebox widget which will contain an icon indicating which layout we're using.
	-- We need one layoutbox per screen.
	s.mylayoutbox = awful.widget.layoutbox(s)
	s.mylayoutbox:buttons(gears.table.join(
	awful.button({ }, 1, function () awful.layout.inc( 1) end),
	awful.button({ }, 3, function () awful.layout.inc(-1) end),
	awful.button({ }, 4, function () awful.layout.inc( 1) end),
	awful.button({ }, 5, function () awful.layout.inc(-1) end)))
	-- Create a taglist widget
	s.mytaglist = awful.widget.taglist {
		screen = s,
		filter = awful.widget.taglist.filter.all,
		buttons = taglist_buttons
	}

	-- Create a tasklist widget
	s.mytasklist = awful.widget.tasklist {
		screen = s,
		filter = awful.widget.tasklist.filter.currenttags,
		buttons = tasklist_buttons,
	}

	-- Create the wibox
	s.mywibox = awful.wibar({ position = "top", screen = s, height = 24 })

	-- Add widgets to the wibox
	s.mywibox:setup {
		layout = wibox.layout.align.horizontal,
		{ -- Left widgets
			layout = wibox.layout.fixed.horizontal,
			-- mylauncher,
			-- praisewidget,
			s.mytaglist,
			s.mypromptbox,
		},
		s.mytasklist, -- Middle widget
		{ -- Right widgets
			mybattery,
			wibox.layout.margin(wibox.widget.systray(), 2, 2, 2, 2),
			mytextclock,
			layout = wibox.layout.fixed.horizontal,
			s.mylayoutbox,
		},
	}
end)
