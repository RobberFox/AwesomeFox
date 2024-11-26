![image](https://github.com/user-attachments/assets/b46ca6b7-af10-419d-a18b-53dfab41b637)

# Modularized AwesomeWM configuration:

**Notes:**
- It's not recommended to blindly copy this config since it contains a `backlight.sh` script which requires adding privilege to users to edit `/sys/class/backlight` (see: https://wiki.archlinux.org/title/Backlight)
- This config has been stripped off of xdesktop appmenu, titlebars and all code related to them.
![image](https://github.com/user-attachments/assets/41b869c4-1257-4822-93ee-11ff0c2c3f34)

### Appearance
Contains customization of the wibar and popup wibox.
- Padding - auxillary widget to add spacing between other widgets (not used yet)
- Taglist, tasklist, system tray widgets are extracted into separate files. Every widget is put inside a method with `s`-screen argument used for the wibar in `awful.screen.connect_for_each_screen(function(s) ...`. Same with the `set_wallpaper` in `wallpaper.lua`
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
2. `clientkeys.lua` - keys related to client manipulation (similarly, in `main/rule.lua`: `keys = clientkeys,`)
3. `globalbuttons.lua` - 4th, 5th buttons on mouse (not needed, at least for me)
4. `globalkey.lua` - global hotkeys and `brighness_emit`, `volume_emit` (used to send signals to tray widgets) functions that are invoked with appropriate hotkeys
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
`autostart.lua` - startup applications.
`share_keyboard_layout.lua` - signals that imitate IBus "local layout" behaviour (Share same input method among all windows = disabled). Contains `us(altgr-intl)` string literal as a default layout.
### Script
- This is just *my* stuff, not useful for others.

Scripts for laptop: brightness controls, volume controls, sensitivity for my keyboard's Razer Cobra mouse.
`set_xkb_layout.sh` and `xkb_group.sh` are for using several input methods (us, ru, am)
