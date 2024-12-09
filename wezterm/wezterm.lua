-- PULL in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 19

config.enable_tab_bar = false
config.window_decorations = "RESIZE"

config.color_scheme = 'Catppuccin Macchiato'

-- Use ⌘⇧] to toggle 'floating' WezTerm windows
config.keys = {
    {
      key = ']',
      mods = 'CMD|SHIFT',
      action = wezterm.action.ToggleAlwaysOnTop,
    },
    -- This will create a new horizontal split and run your default program inside it
    {
      key = '\\',
      mods = 'CTRL',
      action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
     -- This will create a new vertical split and run your default program inside it
    {
      key = '-',
      mods = 'CTRL',
      action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    -- Show the selector, using the quick_select_alphabet
    {
      key = "o",
      mods = "CTRL",
      action = wezterm.action { PaneSelect={} },
    },
}

return config
