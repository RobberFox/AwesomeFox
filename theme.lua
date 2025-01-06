local theme_assets = require("beautiful.theme_assets")
local vars = require("main.user_variable")

local dpi = vars.dpi
local themes_path = vars.themes_path
local config_path = vars.config_path

local theme = {}

theme.font = "jetbrainsmono bold 11"

theme.bg_normal = "#1a1b26"
theme.bg_focus = "#292e42"
theme.bg_urgent = "#ff0000"
theme.bg_minimize = "#666666"
theme.bg_systray = theme.bg_normal

theme.fg_normal = "#a9b1d6"
theme.fg_focus = "#c8d3f5"
theme.fg_urgent = "#ffffff"
theme.fg_minimize = "#ffffff"

theme.useless_gap = dpi(0)
theme.border_width = dpi(1)
theme.border_normal = "#1a1b26"
theme.border_focus = "#7aa2f7"
theme.border_marked = "#91231c"

theme.black = "#1a1b26"
theme.gray = "#3b4261"
theme.red = "#f7768e"
theme.green = "#9ece6a"
theme.yellow = "#e0af68"
theme.blue = "#7aa2f7"
theme.magenta = "#bb9af7"
theme.cyan = "#7dcfff"
theme.white = "#a9b1d6"
theme.orange = "#ff9e64"

theme.html_white = "<span color='"..theme.fg_focus.."'>"
theme.html_gray = "<span color='"..theme.gray.."'>"

-- theme.fg_grey = "#424242"
-- theme.fg_black = "#080808"
-- theme.fg_red = "#ce5666"
-- theme.fg_green = "#80a673"
-- theme.fg_yellow = "#ffaf5f"
-- theme.fg_blue = "#778baf"
-- theme.fg_magenta = "#94738c"
-- theme.fg_cyan = "#69b2b2"
-- theme.fg_white = "#ffffff"


-- theme.tasklist_disable_task_name = true
-- theme.tasklist_align = "center"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path.."default/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

theme.wallpaper = config_path.."awesome_wallpaper.png"

-- You can use your own layout icons like this:
theme.layout_tile = config_path.."image/tilew.png"
theme.layout_fairv = config_path.."image/fairvw.png"
theme.layout_max = config_path.."image/maxw.png"

theme.layout_fairh = themes_path.."default/layouts/fairhw.png"
theme.layout_floating  = themes_path.."default/layouts/floatingw.png"
theme.layout_magnifier = themes_path.."default/layouts/magnifierw.png"
theme.layout_fullscreen = themes_path.."default/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path.."default/layouts/tilebottomw.png"
theme.layout_tileleft   = themes_path.."default/layouts/tileleftw.png"
theme.layout_tiletop = themes_path.."default/layouts/tiletopw.png"
theme.layout_spiral  = themes_path.."default/layouts/spiralw.png"
theme.layout_dwindle = themes_path.."default/layouts/dwindlew.png"
theme.layout_cornernw = themes_path.."default/layouts/cornernww.png"
theme.layout_cornerne = themes_path.."default/layouts/cornernew.png"
theme.layout_cornersw = themes_path.."default/layouts/cornersww.png"
theme.layout_cornerse = themes_path.."default/layouts/cornersew.png"

return theme
