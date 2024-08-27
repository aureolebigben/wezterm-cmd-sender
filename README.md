# wezterm-cmd-sender
A simple plugin to send command to multiple pane in wezterm

I am new to the world of Lua, so feel free to open pull requests to improve the plugin or the documentation.

# Setup

1. Require the plugin
```lua
local wezterm = require 'wezterm'
local cmd_sender = wezterm.plugin.require("https://github.com/aureolebigben/wezterm-cmd-sender")
```
2. Apply the keybinding to config
```lua
cmd_sender.apply_to_config(config)
```

If you want to change keybinding or description you can pass opts to apply_to_config
```lua
cmd_sender.apply_to_config(config, {
    key = 'mapped:s',
    mods = 'CMD|SHIFT',
    description = 'Enter command to send to all panes of active tab'
})
```

# Methods
All the methods are public, so you can use them to create your own plugin.
