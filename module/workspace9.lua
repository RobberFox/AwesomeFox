local awful = require("awful")

-- local tag = awful.tag.find_by_name(awful.screen.focused(), "9")

awful.spawn.once("kicad", { tag = "9" })
awful.spawn.once("uxterm", { tag = "9" })
awful.spawn.once("qjackctl", { tag = "9" })
