local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.initial_cols = 120
config.initial_rows = 42

config.hide_tab_bar_if_only_one_tab = true

config.font_size = 13
config.font = wezterm.font_with_fallback {
  'DejaVu Sans Mono',
  'Noto Sans Mono CJK JP',
  'Noto Color Emoji',
  'Material Design Icons Desktop',
}

config.warn_about_missing_glyphs=false

config.freetype_load_flags = 'NO_HINTING'          -- または 'TARGET_LIGHT'
config.freetype_load_target = 'Normal'             -- 他に 'Light', 'Mono' なども試せます
config.freetype_render_target = 'HorizontalLcd'    -- サブピクセルレンダリング

config.colors = {
  foreground = '#FFFFFF',
  background = '#121212',
  cursor_bg = 'yellow',
  -- ANSI 0–7
  ansi = {
    "#000000", "#cd0000", "#00cd00", "#cdcd00",
    "#0000cd", "#cd00cd", "#00cdcd", "#e5e5e5",
  },
  -- Bright 8–15
  brights = {
    "#4d4d4d", "#ff0000", "#00ff00", "#ffff00",
    "#1245ff", "#ff00ff", "#00ffff", "#ffffff",
  },

  selection_fg = 'none',
  selection_bg = "#4d4d4d",
}

return config
