local awful = require("awful")
local gears = require("gears")
local menubar = require("menubar")
local naughty = require("naughty")
local hotkeys_popup = require("awful.hotkeys_popup").widget

local vars = require("main.user_variable")

local config_path = vars.config_path
local terminal = vars.terminal
local modkey = vars.modkey
local default_layout = vars.defaut_layout

local tagkey = require("key.tagkey")

-- TODO: Extract into a separate file
local function shell_run()
	awful.prompt.run {
		prompt = "Lua: ",
		textbox = awful.screen.focused().mypromptbox.widget, -- I don't need to require `wibar.lua` since keys are set only after wibar
		exe_callback = awful.util.eval,
		history_path = awful.util.get_cache_dir() .. "/history_eval"
	}
end

local keyboard_layout = "ru"

local function brightness_emit(arg)
	awful.spawn.easy_async_with_shell(config_path.."script/backlight.sh".." "..arg, function(stdout)
		local value = stdout
		if (value ~= nil or value ~= '') then
			awesome.emit_signal("laptop::brightness", value)
		end
	end)
end
brightness_emit("=") -- Otherwise you don't see widget info until the first invocation

local function volume_emit(arg)
	awful.spawn.easy_async_with_shell("amixer set Master".." "..arg, function(stdout)
		local value = stdout
		local percentage = string.match(stdout, "%[%d+%%%]")
		local status = string.match(stdout, "%[%a+%]")
		if (value ~= nil or value ~= '') then
			awesome.emit_signal("laptop::volume", percentage, status)
		end
	end)
end
volume_emit("+") -- Otherwise you don't see widget info until the first invocation

local globalkeys = gears.table.join(tagkey,
awful.key({ modkey, }, "s", hotkeys_popup.show_help, {description="show help", group="awesome"}),
awful.key({ modkey, "Shift" }, "r", awesome.restart, {description = "reload awesome", group = "awesome"}),
awful.key({ modkey, "Shift" }, "q", awesome.quit, {description = "quit awesome", group = "awesome"}),

-- Screens
awful.key({ modkey, "Control" }, "j", function() awful.screen.focus_relative(1) end, {description = "focus the next screen", group = "screen"}),
awful.key({ modkey, "Control" }, "k", function() awful.screen.focus_relative(-1) end, {description = "focus the previous screen", group = "screen"}),

-- Tag browsing
awful.key({ modkey, }, "Left", awful.tag.viewprev, {description = "view previous", group = "tag"}),
awful.key({ modkey, }, "Right", awful.tag.viewnext, {description = "view next", group = "tag"}),
awful.key({ modkey, }, "Escape", function()
	awful.tag.history.restore()
	client.focus = awful.client.getmaster()
end, {description = "go back", group = "tag"}),

-- Window manipulation
awful.key({ modkey, "Shift" }, "j", function() awful.client.swap.byidx(-1) end, {description = "swap with previous client", group = "1 window"}),
awful.key({ modkey, "Shift" }, "k", function() awful.client.swap.byidx(1) end, {description = "swap with next client", group = "1 window"}),
awful.key({ modkey, }, "k", function() awful.client.focus.byidx(1) end, {description = "focus previous by index", group = "1 window"}),
awful.key({ modkey, }, "j", function() awful.client.focus.byidx(-1) end, {description = "focus next by index", group = "1 window"}),

awful.key({ modkey, }, "Tab", function()
	awful.client.focus.history.previous()
	if client.focus then
		client.focus:raise()
	end
end, {description = "go back", group = "3 client"}),
-- awful.key({ modkey, }, "u", awful.client.urgent.jumpto, {description = "jump to urgent client", group = "3 client"}),

awful.key({ modkey, }, "space", function() awful.layout.inc(1) end, {description = "select next", group = "layout"}),
awful.key({ modkey, "Shift" }, "space", function() awful.layout.inc(-1) end, {description = "select previous", group = "layout"}),

awful.key({ modkey, "Control" }, "n", function()
	local c = awful.client.restore()
	-- Focus restored client
	if c then
		c:emit_signal("request::activate", "key.unminimize", {raise = true})
	end
end, {description = "restore minimized", group = "4 min/max"}),

-- Window manipulation with incrementation
awful.key({ modkey, }, "l", function() awful.tag.incmwfact(0.05) end, {description = "increase master width factor", group = "2 window - increment"}),
awful.key({ modkey, }, "h", function() awful.tag.incmwfact(-0.05) end, {description = "decrease master width factor", group = "2 window - increment"}),
awful.key({ modkey, }, "y", function() awful.screen.focused().selected_tag.master_width_factor = 1/3 end, {description = "master width factor: 1/3", group = "2 window - increment"}),
awful.key({ modkey, }, "u", function() awful.screen.focused().selected_tag.master_width_factor = 0.5 end, {description = "master width factor: 1/3", group = "2 window - increment"}),
awful.key({ modkey, }, "i", function() awful.screen.focused().selected_tag.master_width_factor = 0.65 end, {description = "master width factor: 0.65", group = "2 window - increment"}),
awful.key({ modkey, "Shift" }, "h", function() awful.tag.incnmaster(1, nil, true) end, {description = "increase the number of master clients", group = "2 window - increment"}),
awful.key({ modkey, "Shift" }, "l", function() awful.tag.incnmaster(-1, nil, true) end, {description = "decrease the number of master clients", group = "2 window - increment"}),
awful.key({ modkey, "Control" }, "h", function() awful.tag.incncol(1, nil, true) end, {description = "increase the number of columns", group = "2 window - increment"}),
awful.key({ modkey, "Control" }, "l", function() awful.tag.incncol(-1, nil, true) end, {description = "decrease the number of columns", group = "2 window - increment"}),

-- Running
awful.key({ modkey, }, "Return", function() awful.spawn(terminal, false) end, {description = "open a terminal", group = "5 run"}),
awful.key({ modkey }, "p", function() menubar.show(s) end, {description = "show the menubar", group = "5 run"}),
awful.key({ modkey }, "r", function() awful.screen.focused().mypromptbox:run() end, {description = "run prompt", group = "5 run"}),
awful.key({ modkey }, "x", shell_run, {description = "lua execute prompt", group = "5 run"}),

-- My own bindings
awful.key({ modkey }, "a", function() awful.spawn.with_shell("flameshot gui", false) end, {description = "run flameshot", group = "robberfox"}),
awful.key({ modkey, "Shift" }, "a", function() awful.spawn.with_shell("flameshot full", false) end, {description = "fullscreen flameshot", group = "robberfox"}),
awful.key({ modkey }, "e", function() awful.spawn.with_shell("thunar", false) end, {description = "thunar filemanager", group = "robberfox"}),
awful.key({ modkey }, "z", function()
	for s in screen do
		s.mywibox.visible = not s.mywibox.visible
	end
end, {description = "hide wibar", group = "robberfox"}),
awful.key({ modkey }, "c", function()
	for s in screen do
		s.mypopup.visible = not s.mypopup.visible
	end
end, {description = "hide keyboard layout popup", group = "robberfox"}),

-- Laptop
awful.key({ modkey }, ",", function()
	volume_emit("toggle")
end, {description = "Laptop - toggle volume", group = "laptop"}),

awful.key({ modkey }, ".", function()
	volume_emit("5%-")
end, {description = "Laptop - volume down", group = "laptop"}),

awful.key({ modkey }, "/", function()
	volume_emit("5%+")
end, {description = "Laptop = volume up", group = "laptop"}),

awful.key({ modkey }, "[", function()
	brightness_emit("")
end, {description = "Laptop = backlight down", group = "laptop"}),

awful.key({ modkey }, "]", function()
	brightness_emit(" +")
end, {description = "Laptop = backlight up", group = "laptop"}),

-- Keyboard layout
awful.key({ modkey }, "q", function()
	keyboard_layout = (keyboard_layout == "ru") and "am" or "ru"
	awful.spawn("xkb-switch -s "..keyboard_layout, false) -- `false` to prevent cursor being stuck in 'loading' state

	naughty.notify({ title = "Layout Group:", text = "us,"..keyboard_layout, timeout = 3 })
end, {description = "Change layout group", group = "language"}),

awful.key({ }, "#191", function()
	awful.spawn.with_shell(config_path.."script/xkb_group.sh '"..vars.defaut_layout.."' "..keyboard_layout)
end, {description = "Change layout", group = "language"})
)

return globalkeys
