-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

local act = wezterm.action

-- This is where you actually apply your config choices

config.check_for_updates = false
config.hide_tab_bar_if_only_one_tab = true
config.warn_about_missing_glyphs = false

-- add │ (pipeish sep for tmux) to default values (all the rest)
config.selection_word_boundary = " \t\n{}[]()\"'`│"

-- disable ligatures
--config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }

config.font =
	--wezterm.font('FiraCode Nerd Font Mono')
	wezterm.font("FiraCode Nerd Font Mono", { weight = 450 })
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

local coloursheme = "Solarized (light) (terminal.sexy)"

local solarized = wezterm.get_builtin_color_schemes()[coloursheme]
solarized.brights[8] = solarized.ansi[8]

config.color_schemes = {
	-- Override the builtin scheme with our modification.
	["Solarized (light) (terminal.sexy)"] = solarized,
}
config.color_scheme = coloursheme

config.inactive_pane_hsb = {
	saturation = 0.1,
	brightness = 0.1,
}

config.colors = {
	compose_cursor = "orange",
}

config.keys = {
	{
		key = "o",
		mods = "SHIFT|CTRL",
		action = wezterm.action.QuickSelectArgs({
			label = "open url",
			patterns = {
				"https?://\\S+",
			},
			action = wezterm.action_callback(function(window, pane)
				local url = window:get_selection_text_for_pane(pane)
				wezterm.log_info("opening: " .. url)
				wezterm.open_with(url)
			end),
		}),
	},
	{
		key = "b",
		mods = "SHIFT|CTRL",
		action = wezterm.action.QuickSelectArgs({
			label = "copy branch",
			patterns = {
				"fra/[[:alnum:]_-]+",
			},
			--      action = wezterm.action_callback(function(window, pane)
			--        local branch = window:get_selection_text_for_pane(pane)
			--        local cp_source = 'PrimarySelection'
			--        local act = wezterm.action
			--        wezterm.log_info('copying branch: ' .. branch)
			--        act.CopyTo(cp_source)
			--        act.PasteFrom(cp_source)
			--      end),
		}),
	},
	{
		key = "k",
		mods = "SHIFT|CTRL",
		action = wezterm.action.QuickSelectArgs({
			label = "copy file",
			patterns = {
				"(~/)?([[:alnum:]_.-]+/)*([[:alnum:]_.-]+)/?",
			},
		}),
	},
}

-- disable scroll wheel
config.mouse_bindings = {
	{
		event = { Down = { streak = 1, button = { WheelUp = 1 } } },
		mods = "NONE",
		action = act.Nop,
	},

	{
		event = { Down = { streak = 1, button = { WheelDown = 1 } } },
		mods = "NONE",
		action = act.Nop,
	},
}

-- and finally, return the configuration to wezterm
return config
