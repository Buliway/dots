local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local act = wezterm.action
-- Конфиг писать ниже


config.color_scheme = 'Gruvbox Dark (Gogh)'

config.font = wezterm.font 'FiraCode Nerd Font'

config.hide_tab_bar_if_only_one_tab = true

config.keys = {
    {   -- Бинд на переименование вкладки. В стоке на этот бинд ребут конфига был, но он и так на лету применяется
        key = 'R',
        mods = 'CTRL|SHIFT',
        action = act.PromptInputLine {
          description = 'Enter new name for tab',
          action = wezterm.action_callback(function(window, _, line)
            -- line will be `nil` if they hit escape without entering anything
            -- An empty string if they just hit enter
            -- Or the actual line of text they wrote
            if line then
              window:active_tab():set_title(line)
            end
          end),
        },
    },

    {   -- Открыть конфиг везтерма в нвиме
        key = 'F8',
        mods = 'CTRL|SHIFT',
        action = act.SpawnCommandInNewTab {
          cwd = os.getenv('WEZTERM_CONFIG_DIR'),
          set_environment_variables = {
            TERM = 'screen-256color',
          },
          args = {
            '/usr/bin/nvim',
            os.getenv('WEZTERM_CONFIG_FILE'),
          },
        },
    },
    -- other keys
}


-- Конфиг писать выше
return config
