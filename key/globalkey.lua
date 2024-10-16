local awful = require("awful")
local gears = require("gears")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup").widget

local vars = require("main.user-variable")

local config_path = vars.config_path
local terminal = vars.terminal
local modkey = vars.modkey

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

local function spawn_here(cmd)
    awful.spawn(cmd, {
        tag = mouse.screen.selected_tag,
    })
end


-- menubar.prompt_args {
-- 	exe_callback = spawn_here()
-- }

local function menubar_run()
	menubar.show()
end

local globalkeys = gears.table.join(tagkey,
awful.key({ modkey, }, "s", hotkeys_popup.show_help, {description="show help", group="awesome"}),
awful.key({ modkey, "Shift" }, "r", awesome.restart, {description = "reload awesome", group = "awesome"}),
awful.key({ modkey, "Shift" }, "q", awesome.quit, {description = "quit awesome", group = "awesome"}),

-- Screens
awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end, {description = "focus the next screen", group = "screen"}),
awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end, {description = "focus the previous screen", group = "screen"}),

-- Tag browsing
awful.key({ modkey, }, "Left", awful.tag.viewprev, {description = "view previous", group = "tag"}),
awful.key({ modkey, }, "Right", awful.tag.viewnext, {description = "view next", group = "tag"}),
awful.key({ modkey, }, "Escape", function()
	awful.tag.history.restore()
	client.focus = awful.client.getmaster()
end, {description = "go back", group = "tag"}),



-- Window manipulation
awful.key({ modkey, "Shift" }, "j", function () awful.client.swap.byidx( 1) end, {description = "swap with next client by index", group = "1 window"}),
awful.key({ modkey, "Shift" }, "k", function () awful.client.swap.byidx( -1) end, {description = "swap with previous client by index", group = "1 window"}),
awful.key({ modkey, }, "j", function () awful.client.focus.byidx( 1) end, {description = "focus next by index", group = "1 window"}),
awful.key({ modkey, }, "k", function () awful.client.focus.byidx(-1) end, {description = "focus previous by index", group = "1 window"}),

awful.key({ modkey, }, "Tab", function ()
	awful.client.focus.history.previous()
	if client.focus then
		client.focus:raise()
	end
end, {description = "go back", group = "3 client"}),
awful.key({ modkey, }, "u", awful.client.urgent.jumpto, {description = "jump to urgent client", group = "3 client"}),

awful.key({ modkey, }, "space", function () awful.layout.inc(1) end, {description = "select next", group = "layout"}),
awful.key({ modkey, "Shift" }, "space", function () awful.layout.inc(-1) end, {description = "select previous", group = "layout"}),

awful.key({ modkey, "Control" }, "n", function ()
	local c = awful.client.restore()
	-- Focus restored client
	if c then
		c:emit_signal(
		"request::activate", "key.unminimize", {raise = true}
		)
	end
end, {description = "restore minimized", group = "4 min/max"}),

-- Window manipulation with incrementation
awful.key({ modkey, }, "l", function () awful.tag.incmwfact( 0.05) end, {description = "increase master width factor", group = "2 window - increment"}),
awful.key({ modkey, }, "h", function () awful.tag.incmwfact(-0.05) end, {description = "decrease master width factor", group = "2 window - increment"}),
awful.key({ modkey, "Shift" }, "h", function () awful.tag.incnmaster( 1, nil, true) end, {description = "increase the number of master clients", group = "2 window - increment"}),
awful.key({ modkey, "Shift" }, "l", function () awful.tag.incnmaster(-1, nil, true) end, {description = "decrease the number of master clients", group = "2 window - increment"}),
awful.key({ modkey, "Control" }, "h", function () awful.tag.incncol( 1, nil, true) end, {description = "increase the number of columns", group = "2 window - increment"}),
awful.key({ modkey, "Control" }, "l", function () awful.tag.incncol(-1, nil, true) end, {description = "decrease the number of columns", group = "2 window - increment"}),

-- Running
awful.key({ modkey, }, "Return", function () awful.spawn(terminal) end, {description = "open a terminal", group = "5 run"}),
awful.key({ modkey }, "p", function() menubar_run() end, {description = "show the menubar", group = "5 run"}),
awful.key({ modkey }, "r", function() awful.screen.focused().mypromptbox:run() end, {description = "run prompt", group = "5 run"}),
awful.key({ modkey }, "x", shell_run, {description = "lua execute prompt", group = "5 run"}),

-- My own bindings
awful.key({ modkey }, "a", function() awful.spawn.with_shell("flameshot gui") end, {description = "run flameshot", group = "robberfox"}),
awful.key({ modkey }, "z", function()
	for s in screen do
		s.mywibox.visible = not s.mywibox.visible
	end
end, {description = "hide wibar", group = "robberfox"}),

-- Laptop
awful.key({}, "#121", function () awful.util.spawn("amixer set Master toggle", false) end, {description = "Laptop - toggle volume", group = "laptop"}),
awful.key({}, "#122", function () awful.util.spawn("amixer set Master 5%-") end, {description = "Laptop - volume down", group = "laptop"}),
awful.key({}, "#123", function () awful.util.spawn("amixer set Master 5%+") end, {description = "Laptop = volume up", group = "laptop"}),

awful.key({ modkey }, "[", function () awful.util.spawn(config_path.."script/backlight.sh") end, {description = "Laptop = backlight down", group = "laptop"}),
awful.key({ modkey }, "]", function () awful.util.spawn(config_path.."script/backlight.sh +") end, {description = "Laptop = backlight up", group = "laptop"})
)

return globalkeys
