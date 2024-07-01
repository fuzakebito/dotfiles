local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config = {
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  font = wezterm.font 'Firge35Nerd Console',
  font_size = 11.0,
  default_cursor_style = 'SteadyUnderline',
  force_reverse_video_cursor = true,
  cursor_thickness = '0.15cell',
  use_fancy_tab_bar = false,
  colors = require('antibalus').colors,
  bold_brightens_ansi_colors = false,
}

return config
