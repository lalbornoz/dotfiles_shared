local wezterm = require "wezterm"

return {
    bidi_enabled = false,
    check_for_updates = false,
    max_fps = 60,

    -- {{{ background {}
    background = {
        {
            source = {
                Color = "black",
            },

            height = '100%',
            width = '100%',
        },
        {
            source = {
                File = wezterm.home_dir .. '/.wallpapers/wallpaper.wezterm.png'
            },

            height = '100%',
            horizontal_align = 'Center',
            opacity = 0.3,
            repeat_x = 'NoRepeat',
            repeat_y = 'NoRepeat',
            vertical_align = 'Middle',
            width = '35%',
        },
    },
    -- }}}
    keys = {
        -- {{{ keys {}: disable default assignments
        { key = 'Tab', mods = 'CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 'Tab', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 'Enter', mods = 'ALT', action = wezterm.action.DisableDefaultAssignment },
        { key = '!', mods = 'CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = '!', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = '"', mods = 'ALT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = '"', mods = 'SHIFT|ALT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = '#', mods = 'CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = '#', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = '$', mods = 'CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = '$', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = '%', mods = 'CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = '%', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = '%', mods = 'ALT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = '%', mods = 'SHIFT|ALT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = '&', mods = 'CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = '&', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = "'", mods = 'SHIFT|ALT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = '(', mods = 'CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = '(', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = ')', mods = 'CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = ')', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = '*', mods = 'CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = '*', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = '+', mods = 'CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = '+', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = '-', mods = 'CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = '-', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = '-', mods = 'SUPER', action = wezterm.action.DisableDefaultAssignment },
        { key = '0', mods = 'CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = '0', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = '0', mods = 'SUPER', action = wezterm.action.DisableDefaultAssignment },
        { key = '1', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = '1', mods = 'SUPER', action = wezterm.action.DisableDefaultAssignment },
        { key = '2', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = '2', mods = 'SUPER', action = wezterm.action.DisableDefaultAssignment },
        { key = '3', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = '3', mods = 'SUPER', action = wezterm.action.DisableDefaultAssignment },
        { key = '4', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = '4', mods = 'SUPER', action = wezterm.action.DisableDefaultAssignment },
        { key = '5', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = '5', mods = 'SHIFT|ALT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = '5', mods = 'SUPER', action = wezterm.action.DisableDefaultAssignment },
        { key = '6', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = '6', mods = 'SUPER', action = wezterm.action.DisableDefaultAssignment },
        { key = '7', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = '7', mods = 'SUPER', action = wezterm.action.DisableDefaultAssignment },
        { key = '8', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = '8', mods = 'SUPER', action = wezterm.action.DisableDefaultAssignment },
        { key = '9', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = '9', mods = 'SUPER', action = wezterm.action.DisableDefaultAssignment },
        { key = '=', mods = 'CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = '=', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = '=', mods = 'SUPER', action = wezterm.action.DisableDefaultAssignment },
        { key = '@', mods = 'CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = '@', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 'C', mods = 'CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 'C', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 'F', mods = 'CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 'F', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 'K', mods = 'CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 'K', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 'L', mods = 'CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 'L', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 'M', mods = 'CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 'M', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 'N', mods = 'CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 'N', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 'P', mods = 'CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 'P', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 'R', mods = 'CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 'R', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 'T', mods = 'CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 'T', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 'U', mods = 'CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 'U', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 'V', mods = 'CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 'V', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 'W', mods = 'CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 'W', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 'X', mods = 'CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 'X', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 'Z', mods = 'CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 'Z', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = '[', mods = 'SHIFT|SUPER', action = wezterm.action.DisableDefaultAssignment },
        { key = ']', mods = 'SHIFT|SUPER', action = wezterm.action.DisableDefaultAssignment },
        { key = '^', mods = 'CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = '^', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = '_', mods = 'CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = '_', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 'c', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 'c', mods = 'SUPER', action = wezterm.action.DisableDefaultAssignment },
        { key = 'f', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 'f', mods = 'SUPER', action = wezterm.action.DisableDefaultAssignment },
        { key = 'k', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 'k', mods = 'SUPER', action = wezterm.action.DisableDefaultAssignment },
        { key = 'l', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 'm', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 'm', mods = 'SUPER', action = wezterm.action.DisableDefaultAssignment },
        { key = 'n', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 'n', mods = 'SUPER', action = wezterm.action.DisableDefaultAssignment },
        { key = 'p', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 'r', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 'r', mods = 'SUPER', action = wezterm.action.DisableDefaultAssignment },
        { key = 't', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 't', mods = 'SUPER', action = wezterm.action.DisableDefaultAssignment },
        { key = 'u', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 'v', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 'v', mods = 'SUPER', action = wezterm.action.DisableDefaultAssignment },
        { key = 'w', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 'w', mods = 'SUPER', action = wezterm.action.DisableDefaultAssignment },
        { key = 'x', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 'z', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = '{', mods = 'SUPER', action = wezterm.action.DisableDefaultAssignment },
        { key = '{', mods = 'SHIFT|SUPER', action = wezterm.action.DisableDefaultAssignment },
        { key = '}', mods = 'SUPER', action = wezterm.action.DisableDefaultAssignment },
        { key = '}', mods = 'SHIFT|SUPER', action = wezterm.action.DisableDefaultAssignment },
        { key = 'phys:Space', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 'PageUp', mods = 'SHIFT', action = wezterm.action.DisableDefaultAssignment },
        { key = 'PageUp', mods = 'CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 'PageUp', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 'PageDown', mods = 'SHIFT', action = wezterm.action.DisableDefaultAssignment },
        { key = 'PageDown', mods = 'CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 'PageDown', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 'LeftArrow', mods = 'SHIFT|ALT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 'LeftArrow', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 'RightArrow', mods = 'SHIFT|ALT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 'RightArrow', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 'UpArrow', mods = 'SHIFT|ALT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 'UpArrow', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 'DownArrow', mods = 'SHIFT|ALT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 'DownArrow', mods = 'SHIFT|CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 'Insert', mods = 'SHIFT', action = wezterm.action.DisableDefaultAssignment },
        { key = 'Insert', mods = 'CTRL', action = wezterm.action.DisableDefaultAssignment },
        { key = 'Copy', mods = 'NONE', action = wezterm.action.DisableDefaultAssignment },
        { key = 'Paste', mods = 'NONE', action = wezterm.action.DisableDefaultAssignment },
        -- }}}
        { key = 'PageDown', mods = 'SHIFT', action = wezterm.action.ScrollByPage(1) },
        { key = 'PageUp', mods = 'SHIFT', action = wezterm.action.ScrollByPage(-1) },
        { key = '-', mods = 'CTRL', action = wezterm.action.SendKey { key = '_', mods = 'SHIFT|CTRL' } },
    },

    key_tables = {
        copy_mode = {
            -- {{{ copy_mode {}: disable default assignments
            { key = 'Tab', mods = 'NONE', action = wezterm.action.DisableDefaultAssignment },
            { key = 'Tab', mods = 'SHIFT', action = wezterm.action.DisableDefaultAssignment },
            { key = 'Enter', mods = 'NONE', action = wezterm.action.DisableDefaultAssignment },
            { key = 'Escape', mods = 'NONE', action = wezterm.action.DisableDefaultAssignment },
            { key = 'Space', mods = 'NONE', action = wezterm.action.DisableDefaultAssignment },
            { key = '$', mods = 'NONE', action = wezterm.action.DisableDefaultAssignment },
            { key = '$', mods = 'SHIFT', action = wezterm.action.DisableDefaultAssignment },
            { key = ',', mods = 'NONE', action = wezterm.action.DisableDefaultAssignment },
            { key = '0', mods = 'NONE', action = wezterm.action.DisableDefaultAssignment },
            { key = ';', mods = 'NONE', action = wezterm.action.DisableDefaultAssignment },
            { key = 'F', mods = 'NONE', action = wezterm.action.DisableDefaultAssignment },
            { key = 'F', mods = 'SHIFT', action = wezterm.action.DisableDefaultAssignment },
            { key = 'G', mods = 'NONE', action = wezterm.action.DisableDefaultAssignment },
            { key = 'G', mods = 'SHIFT', action = wezterm.action.DisableDefaultAssignment },
            { key = 'H', mods = 'NONE', action = wezterm.action.DisableDefaultAssignment },
            { key = 'H', mods = 'SHIFT', action = wezterm.action.DisableDefaultAssignment },
            { key = 'L', mods = 'NONE', action = wezterm.action.DisableDefaultAssignment },
            { key = 'L', mods = 'SHIFT', action = wezterm.action.DisableDefaultAssignment },
            { key = 'M', mods = 'NONE', action = wezterm.action.DisableDefaultAssignment },
            { key = 'M', mods = 'SHIFT', action = wezterm.action.DisableDefaultAssignment },
            { key = 'O', mods = 'NONE', action = wezterm.action.DisableDefaultAssignment },
            { key = 'O', mods = 'SHIFT', action = wezterm.action.DisableDefaultAssignment },
            { key = 'T', mods = 'NONE', action = wezterm.action.DisableDefaultAssignment },
            { key = 'T', mods = 'SHIFT', action = wezterm.action.DisableDefaultAssignment },
            { key = 'V', mods = 'NONE', action = wezterm.action.DisableDefaultAssignment },
            { key = 'V', mods = 'SHIFT', action = wezterm.action.DisableDefaultAssignment },
            { key = '^', mods = 'NONE', action = wezterm.action.DisableDefaultAssignment },
            { key = '^', mods = 'SHIFT', action = wezterm.action.DisableDefaultAssignment },
            { key = 'b', mods = 'NONE', action = wezterm.action.DisableDefaultAssignment },
            { key = 'b', mods = 'ALT', action = wezterm.action.DisableDefaultAssignment },
            { key = 'b', mods = 'CTRL', action = wezterm.action.DisableDefaultAssignment },
            { key = 'c', mods = 'CTRL', action = wezterm.action.DisableDefaultAssignment },
            { key = 'f', mods = 'NONE', action = wezterm.action.DisableDefaultAssignment },
            { key = 'f', mods = 'ALT', action = wezterm.action.DisableDefaultAssignment },
            { key = 'f', mods = 'CTRL', action = wezterm.action.DisableDefaultAssignment },
            { key = 'g', mods = 'NONE', action = wezterm.action.DisableDefaultAssignment },
            { key = 'g', mods = 'CTRL', action = wezterm.action.DisableDefaultAssignment },
            { key = 'h', mods = 'NONE', action = wezterm.action.DisableDefaultAssignment },
            { key = 'j', mods = 'NONE', action = wezterm.action.DisableDefaultAssignment },
            { key = 'k', mods = 'NONE', action = wezterm.action.DisableDefaultAssignment },
            { key = 'l', mods = 'NONE', action = wezterm.action.DisableDefaultAssignment },
            { key = 'm', mods = 'ALT', action = wezterm.action.DisableDefaultAssignment },
            { key = 'o', mods = 'NONE', action = wezterm.action.DisableDefaultAssignment },
            { key = 'q', mods = 'NONE', action = wezterm.action.DisableDefaultAssignment },
            { key = 't', mods = 'NONE', action = wezterm.action.DisableDefaultAssignment },
            { key = 'v', mods = 'NONE', action = wezterm.action.DisableDefaultAssignment },
            { key = 'v', mods = 'CTRL', action = wezterm.action.DisableDefaultAssignment },
            { key = 'w', mods = 'NONE', action = wezterm.action.DisableDefaultAssignment },
            { key = 'y', mods = 'NONE', action = wezterm.action.DisableDefaultAssignment },
            { key = 'PageUp', mods = 'NONE', action = wezterm.action.DisableDefaultAssignment },
            { key = 'PageDown', mods = 'NONE', action = wezterm.action.DisableDefaultAssignment },
            { key = 'LeftArrow', mods = 'NONE', action = wezterm.action.DisableDefaultAssignment },
            { key = 'LeftArrow', mods = 'ALT', action = wezterm.action.DisableDefaultAssignment },
            { key = 'RightArrow', mods = 'NONE', action = wezterm.action.DisableDefaultAssignment },
            { key = 'RightArrow', mods = 'ALT', action = wezterm.action.DisableDefaultAssignment },
            { key = 'UpArrow', mods = 'NONE', action = wezterm.action.DisableDefaultAssignment },
            { key = 'DownArrow', mods = 'NONE', action = wezterm.action.DisableDefaultAssignment },
            -- }}}
        },
        search_mode = {
            -- {{{ search_mode {}: disable default assignments
            { key = 'Enter', mods = 'NONE', action = wezterm.action.DisableDefaultAssignment },
            { key = 'Escape', mods = 'NONE', action = wezterm.action.DisableDefaultAssignment },
            { key = 'n', mods = 'CTRL', action = wezterm.action.DisableDefaultAssignment },
            { key = 'p', mods = 'CTRL', action = wezterm.action.DisableDefaultAssignment },
            { key = 'r', mods = 'CTRL', action = wezterm.action.DisableDefaultAssignment },
            { key = 'u', mods = 'CTRL', action = wezterm.action.DisableDefaultAssignment },
            { key = 'PageUp', mods = 'NONE', action = wezterm.action.DisableDefaultAssignment },
            { key = 'PageDown', mods = 'NONE', action = wezterm.action.DisableDefaultAssignment },
            { key = 'UpArrow', mods = 'NONE', action = wezterm.action.DisableDefaultAssignment },
            { key = 'DownArrow', mods = 'NONE', action = wezterm.action.DisableDefaultAssignment },
            -- }}}
        },
    },

    mouse_bindings = {
        -- {{{ mouse_bindings {}
        {
            event = { Down = { streak = 1, button = { WheelUp = 1 } } },
            mods = 'CTRL',
            action = wezterm.action.IncreaseFontSize,
        },
        {
            event = { Down = { streak = 1, button = { WheelDown = 1 } } },
            mods = 'CTRL',
            action = wezterm.action.DecreaseFontSize,
        },
        {
            event = { Down = { streak = 1, button = { WheelUp = 1 } } },
            mods = 'SHIFT',
            action = wezterm.action.SendKey { key = 'PageUp', mods = '' },
        },
        {
            event = { Down = { streak = 1, button = { WheelDown = 1 } } },
            mods = 'SHIFT',
            action = wezterm.action.SendKey { key = 'PageDown', mods = '' },
        },
        {
            event = { Down = { streak = 1, button = 'Middle' } },
            mods = 'CTRL',
            action = wezterm.action.Multiple {
                wezterm.action.SendKey { key = 'a', mods = 'CTRL' },
                wezterm.action.SendKey { key = '[', mods = '' },
            }
        },
        {
            event = { Down = { streak = 1, button = 'Middle' } },
            mods = 'SHIFT',
            action = wezterm.action.Multiple {
                wezterm.action.SendKey { key = 'c', mods = 'CTRL' },
            }
        },
        -- }}}
    },

    hide_tab_bar_if_only_one_tab = true,

    warn_about_missing_glyphs = false
}

-- vim:expandtab sw=4 ts=4
