-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config = {
    leader = {
        key = "a",
        mods = "CTRL",
        timeout_milliseconds = 2000,
    },
    use_fancy_tab_bar = false,
    tab_bar_at_top = true,

    keys = {
        -- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
        {
            key = "a",
            mods = "LEADER|CTRL",
            action = act.SendKey({ key = "a", mods = "CTRL" }),
        },
        {
            key = "|",
            mods = "LEADER|SHIFT",
            action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
        },
        {
            key = "-",
            mods = "LEADER",
            action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
        },
        {
            key = "H",
            mods = "LEADER",
            action = act.AdjustPaneSize({ "Left", 5 }),
        },
        {
            key = "J",
            mods = "LEADER",
            action = act.AdjustPaneSize({ "Down", 5 }),
        },
        {
            key = "K",
            mods = "LEADER",
            action = act.AdjustPaneSize({ "Up", 5 }),
        },
        {
            key = "L",
            mods = "LEADER",
            action = act.AdjustPaneSize({ "Right", 5 }),
        },
        -- Window management
        {
            key = "z",
            mods = "LEADER",
            action = "TogglePaneZoomState",
        },
        { key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
        { key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
        { key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
        { key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
    },

    automatically_reload_config = true,

    -- Set PowerShell as default shell
    default_prog = { "C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe" },

    enable_tab_bar = false,
    window_close_confirmation = "NeverPrompt",
    window_decorations = "RESIZE",
    color_scheme = "tokyonight_night",

    font = wezterm.font("JetBrains Mono", { weight = "Medium" }),
    font_size = 11.5,

    window_padding = {
        top = 2,
        bottom = 2,
        left = 2,
        right = 2,
    },
    background = {
        {
            source = {
                -- File = "$HOME/.config/wezterm/wallpapers/Lake.jpg",
                File = "C:/Users/chama/.config/wezterm/wallpapers/Lake.jpg",
            },
            hsb = {
                hue = 1.0,
                saturation = 1.02,
                brightness = 0.25,
            },
            width = "100%",
            height = "100%",
        },
        {
            source = {
                Color = "#282c35",
            },
            width = "100%",
            height = "100%",
            opacity = 0.55,
        },
    },
}

-- and finally, return the configuration to wezterm
return config
