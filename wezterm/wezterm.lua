-- PULL in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()
local keys = {}
local act = wezterm.action

config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 19

config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.show_tabs_in_tab_bar = false
config.show_new_tab_button_in_tab_bar = false

config.window_decorations = "RESIZE"

config.color_scheme = 'Catppuccin Macchiato'
config.window_background_opacity = 0.9


table.insert(keys, { key = ']', mods = 'CMD|SHIFT', action = act.ToggleAlwaysOnTop })
-- This will create a new horizontal split and run your default program inside it
table.insert(keys, { key = '\\', mods = 'CTRL', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } })
-- This will create a new vertical split and run your default program inside it
table.insert(keys, { key = '-', mods = 'CTRL', action = act.SplitVertical { domain = 'CurrentPaneDomain' } })
-- Show the selector, using the quick_select_alphabet
table.insert(keys, { key = 'o', mods = 'CTRL', action = act { PaneSelect={} } })

-- workspaces
wezterm.on("update-right-status", function(window, pane)
  window:set_right_status(window:active_workspace())
end)
local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")
workspace_switcher.zoxide_path = "/opt/homebrew/bin/zoxide"

table.insert(keys, { key = "s", mods = "CTRL|SHIFT", action = workspace_switcher.switch_workspace() })
table.insert(keys, { key = "t", mods = "CTRL|SHIFT", action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) })
table.insert(keys, { key = "[", mods = "CTRL|SHIFT", action = act.SwitchWorkspaceRelative(1) })
table.insert(keys, { key = "]", mods = "CTRL|SHIFT", action = act.SwitchWorkspaceRelative(-1) })

config.keys = keys

return config
