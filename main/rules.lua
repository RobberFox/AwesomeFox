local gears = require("gears")
local awful = require("awful")

local rules = {
	-- All clients will match this rule.
	{
		id = "global",
		rule = { },
		properties = {
			focus = awful.client.focus.filter,
			raise = true,
			screen = awful.screen.preferred,
			placement = awful.placement.no_overlap+awful.placement.no_offscreen
		}
	},

	-- Floating clients.
	{
		id = "floating",
		rule_any = {
			instance = { "copyq", "pinentry" },
			class = {
				"Arandr", "Blueman-manager", "Gpick", "Kruler", "Sxiv",
				"Tor Browser", "Wpa_gui", "veromix", "xtightvncviewer"
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
		properties = { floating = true }
	},

	{
		rule = { name = "Krita - Edit Text — Krita" },
		properties = {
			floating = true,
			width = 640,
			height = 480,
		},
	},

	{
		rule = { name = "PureRef" },
		properties = {
			floating = true,
		},
	},

	{
		rule = { class = "kitty" },
		properties = { screen = 1, tag = "1-Dev" }
	},
	{
		rule = { class = "obsidian" },
		properties = { screen = 1, tag = "2-Obs" }
	},
	{
		rule = { class = "firefox-esr" },
		properties = { screen = 1, tag = "3-Ffx" }
	},
	{
		rule = { class = "krita" },
		properties = { screen = 1, tag = "4-Drw" }
	},
	{
		rule = { class = "Zathura" },
		properties = { screen = 1, tag = "5-Pdf" }
	}
}

return rules
