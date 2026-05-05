local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local act = wezterm.action

local function apply_unified_theme(config, name)
    local schemes = wezterm.get_builtin_color_schemes()
    local p = schemes[name]
    
    config.color_scheme = name
    if p then
        config.window_frame = { active_titlebar_bg = p.background, inactive_titlebar_bg = p.background }
        config.colors = {
            tab_bar = {
                background = p.background,
                new_tab = { bg_color = p.background, fg_color = p.ansi[7] },
                new_tab_hover = { bg_color = p.ansi[5], fg_color = p.background, italic = true },
                active_tab = { bg_color = p.ansi[5], fg_color = p.background },
                inactive_tab = { bg_color = p.background, fg_color = p.foreground },
            }
        }
    end
end

apply_unified_theme(config, "Catppuccin Macchiato")

config.font = wezterm.font 'JetBrainsMono Nerd Font Mono'

config.initial_cols = 120
config.initial_rows = 30

config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false

config.window_padding = {
    left = 10,
    right = 10,
    top = 5,
    bottom = 5,
}

config.default_prog = { 'C:\\Program Files\\PowerShell\\7\\pwsh.exe' }

config.keys = {
	{ key = 't', mods = 'ALT', action = act.SpawnTab 'DefaultDomain' },                -- 新標籤頁
    { key = 'w', mods = 'ALT', action = act.CloseCurrentTab { confirm = true } },      -- 關閉標簽
    { key = 'Tab', mods = 'ALT', action = act.ActivateTabRelative(1) },               -- 下一個標簽
    { key = 'Tab', mods = 'CTRL|SHIFT', action = act.ActivateTabRelative(-1) },        -- 上一個標簽

    { key = 'r', mods = 'CTRL|SHIFT', action = act.ReloadConfiguration },              -- 重新加載

    { key = 'f', mods = 'ALT', action = act.Search 'CurrentSelectionOrEmptyString' },  --  搜索

    {                                                                                  -- WSL
    	key = '!',
    	mods = 'ALT|SHIFT',
    	action = act.SpawnCommandInNewTab {
    		args = { 'wsl.exe', '~' },
    	},
  	},

  	{
        key = 'd',
        mods = 'ALT',
        action = act.InputSelector {
            title = "command panel",
            choices = {
                { label = "Clear Screen", id = "clear\n" },
                { label = "WSL Shutdown", id = "exit; wsl --shutdown\n" },
            },
            description = "選擇要執行的指令",
            action = wezterm.action_callback(function(window, pane, id, label)
                if id then
                    pane:send_text(id)
                end
            end),
        },
    },
}

for i = 1, 8 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = 'ALT',
		action = act.ActivateTab(i - 1),
	})
end

config.mouse_bindings = {
	{
		event = { Up = { streak = 1, button = 'Left' } },
		mods = 'CTRL',
		action = act.OpenLinkAtMouseCursor,
	},
}

return config