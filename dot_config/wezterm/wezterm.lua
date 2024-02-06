-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.check_for_updates = false
config.hide_tab_bar_if_only_one_tab = true

config.font =
  wezterm.font('FiraCode Nerd Font Mono', { weight = 'Bold' })

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
config.font_size = 9.0
config.color_scheme = 'Solarized (light) (terminal.sexy)'


-- and finally, return the configuration to wezterm
return config

