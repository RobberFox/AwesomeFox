local awful = require("awful")
local beautiful = require("beautiful")

local clientkeys = require("key.clientkey")
local clientbuttons = require("key.clientbutton")

local rules = {
	-- All clients will match this rule.
	{
		rule = { },
		properties = {
			border_width = beautiful.border_width,
			border_color = beautiful.border_normal,
			focus = awful.client.focus.filter,
			raise = true,
			keys = clientkeys,
			buttons = clientbuttons,
			screen = awful.screen.preferred,
			placement = awful.placement.no_overlap+awful.placement.no_offscreen
		}
	},

	-- Floating clients.
	{
		rule_any = {
			instance = {
				"DTA", -- Firefox addon DownThemAll.
				"copyq", -- Includes session name in class.
				"pinentry",
			},

			class = {
				"Arandr",
				"Blueman-manager",
				"Gpick",
				"Kruler",
				"MessageWin", -- kalarm.
				"Sxiv",
				"Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
				"Wpa_gui",
				"veromix",
				"xtightvncviewer"
			},

			-- Note that the name property shown in xprop might be set slightly after creation of the client
			-- and the name shown there might not match defined rules here.
			name = {
				"Event Tester", -- xev.
			},

			role = {
				"AlarmWindow", -- Thunderbird's calendar.
				"ConfigManager", -- Thunderbird's about:config.
				"pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
			}
		},

		properties = { floating = true },
	},

	-- Add titlebars to normal clients and dialogs
	{
		rule_any = {
			type = { "normal", "dialog" }
		},
		properties = { titlebars_enabled = false }
	},

	--{ rule = { class = "kitty" }, properties = { screen = 1, urgent = false, maximized = false, tag = "1-Dev" } },
	{ rule = { class = "obsidian" }, properties = { screen = 1, urgent = false, maximized = false, tag = "2-Obs" } },
	--{ rule = { class = "firefox" }, properties = { screen = 1, urgent = false, maximized = false, tag = "3-Ffx" } },
	{ rule = { class = "krita" }, properties = { screen = 1, urgent = false, maximized = false, tag = "4-Drw" } },
	{ rule = { class = "Zathura" }, properties = { screen = 1, urgent = false, maximized = false, tag = "5-Pdf" } },

	{ rule = { class = "PureRef" }, properties = { screen = 1, floating = true } },

	-- {
	-- 	rule_any = { class = "steam" },
	-- 	properties = {
	-- 		titlebars_enabled = false,
	-- 		floating = true,
	-- 		border_width = 0,
	-- 		border_color = 0,
	-- 		size_hints_honor = false,
	-- 	},
	-- },

	-- {
	-- 	rule_any = { class = "steam_app_410900" },
	-- 	properties = {
	-- 		titlebars_enabled = false,
	-- 		maximized = true,
	-- 		fullscreen = true,
	-- 		floating = true,
	-- 		border_width = 0,
	-- 		border_color = 0,
	-- 		size_hints_honor = false,
	-- 	},
	-- },
}

return rules
