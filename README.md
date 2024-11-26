![image](https://github.com/user-attachments/assets/eda16f6c-0eaf-41f2-a14a-2bfa05180833)
>[!NOTE]
>It's not recommended to blindly copy this config since it contains a `backlight.sh` script which requires adding privilege to users to edit `/sys/class/backlight` (see: https://wiki.archlinux.org/title/Backlight), keyboard layout switching hotkeys that depend on [xkb-switch](https://github.com/sergei-mironov/xkb-switch) and an `autostart.lua` that starts *my* programs/scripts.<br>
>This config has been stripped off of xdesktop appmenu, titlebars and all code related to them.
# Modularized AwesomeWM configuration:
```linux
├── appearance
│   ├── layout_popup.lua
│   ├── padding.lua
│   ├── taglist.lua
│   ├── tasklist.lua
│   ├── tray.lua
│   ├── wallpaper.lua
│   └── wibox.lua
├── image
│   ├── fairvw.png
│   ├── maxw.png
│   └── tilew.png
├── key
│   ├── clientbutton.lua
│   ├── clientkey.lua
│   ├── globalbuttons.lua
│   ├── globalkey.lua
│   └── tagkey.lua
├── main
│   ├── error.lua
│   ├── layout.lua
│   ├── rule.lua
│   ├── signal.lua
│   ├── tag.lua
│   └── user_variable.lua
├── module
│   ├── autostart.lua
│   └── share_keyboard_layout.lua
├── script
│   ├── amixer.sh
│   ├── backlight.sh
│   ├── sensitivity.sh
│   ├── set_xkb_layout.sh
│   └── xkb_group.sh
├── README.md
├── awesome_wallpaper.png
├── rc.lua
└── theme.lua
```
### Appearance
Contains customization of the wibar and popup wibox.
- Padding - auxillary widget to add spacing between other widgets (not used yet)
- Layout popup - colour coded keyboard layout popup widget positioned at bottom center (see main photo)
- Taglist, tasklist, system tray widgets are extracted into separate files. Every widget is put inside a method with `s`-screen argument used for the wibar in `awful.screen.connect_for_each_screen(function(s) ...`, same with the `set_wallpaper` in `wallpaper.lua`
- In `wibox.lua` my widgets are put into a "library" object to not pollute the namespace.
```lua
local appearance = { -- my library
	set_wallpaper = require("appearance.wallpaper"),
	mytaglist = require("appearance.taglist"),
	mytasklist = require("appearance.tasklist"),
	mytraywidgets = require("appearance.tray"),
	mypadding = require("appearance.padding"),
	mypopup = require("appearance.layout_popup")
}
```
### Image
Any custom images will be put here: layout pictures, and in the future: battery, sound, brightness icons.
### Key
In each file the hotkeys table is returned and used in `main/rule.lua` or `rc.lua`.
1. `clientbuttons.lua` used for mouse `button = clientbuttons,` in `main/rule.lua`
2. `clientkeys.lua` - keys related to client manipulation (in `main/rule.lua`: `keys = clientkeys,`)
3. `globalbuttons.lua` - 4th, 5th buttons on mouse (not needed, at least for me)
4. `globalkey.lua` - global hotkeys, auxillary functions and `brighness_emit`, `volume_emit` (used to send signals to tray widgets) functions that are invoked with appropriate hotkeys
5. `tagkey.lua` - same globalkeys but only hotkeys that involve numbers. Here the `tagkey` table is returned and used in `globalkey.lua` to be joined in globalkeys (i.e. in `globalkey.lua`: `local globalkeys = gears.table.join(tagkey, ...`)

Then globalkeys are set in `rc.lua`:
```lua
root.keys(globalkeys)
root.buttons(globalbuttons)
```
### Main
Some files here have no return information and are used in `rc.lua` in a rawdoggin way: (because of this, the rc.lua can seem a bit criptic, idk)
```lua
require("main.error")
require("main.tag")
require("main.signal")
```
`layout.lua`, `rule.lua` and `user-variable.lua` return tables of corresponding info.
### Module
`autostart.lua` - startup applications.<br>
`share_keyboard_layout.lua` - signals that imitate IBus "local layout" behaviour (Share same input method among all windows = disabled). Contains `us(altgr-intl)` string literal as a default layout.
### Script
This is just *my* stuff, not useful for others.<br>
Scripts for laptop: brightness controls, volume controls, sensitivity for my keyboard's Razer Cobra mouse.
`set_xkb_layout.sh` and `xkb_group.sh` are for using several input methods (us, ru, am)
