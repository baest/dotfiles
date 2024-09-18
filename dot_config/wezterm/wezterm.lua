-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

local act = wezterm.action

-- This is where you actually apply your config choices

config.check_for_updates = false
config.hide_tab_bar_if_only_one_tab = true
config.warn_about_missing_glyphs = false

-- disable ligatures
--config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }

config.font =
  wezterm.font('FiraCode Nerd Font Mono')
  --wezterm.font('FiraCode Nerd Font Mono', { weight = 'Medium' })

--config.font = wezterm.font_with_fallback({
--  -- /usr/share/fonts/TTF/FiraCodeNerdFontMono-Bold.ttf, FontConfig
--  {family="FiraCode Nerd Font Mono", weight="Bold"},
--
--  -- /usr/share/fonts/TTF/Roboto-Bold.ttf, FontConfig
--  {family="Roboto", weight="Bold"},
--
--  -- /usr/share/fonts/TTF/JetBrainsMono-Regular.ttf, FontConfig
--  "JetBrains Mono",
--
--})
config.font_size = 9.1
config.color_scheme = 'Solarized (light) (terminal.sexy)'

config.keys = {
  {
    key = 'O',
    mods = 'CTRL',
    action = wezterm.action.QuickSelectArgs {
      label = 'open url',
      patterns = {
        'https?://\\S+',
      },
      action = wezterm.action_callback(function(window, pane)
        local url = window:get_selection_text_for_pane(pane)
        wezterm.log_info('opening: ' .. url)
        wezterm.open_with(url)
      end),
    },
  },
}

-- disable scroll wheel
config.mouse_bindings = {
  {
    event = { Down = { streak = 1, button = { WheelUp = 1 } } },
    mods = 'NONE',
    action = act.Nop,
  },

  {
    event = { Down = { streak = 1, button = { WheelDown = 1 } } },
    mods = 'NONE',
    action = act.Nop,
  },
}


-- and finally, return the configuration to wezterm
return config

