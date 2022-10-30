local path = (...):gsub('%.init%', '')

local awful = require 'awful'

local action = require(path .. '.action')
local key = require(path .. '.key')(awful)

awful.keyboard.append_global_keybindings {
    -- application control
    key.press_mod('Return', action.open_terminal(awful), { when = true }),
    key.press_mod('l', action.open_browser(awful), { when = true }),
    key.press_mod('k', action.open_editor(awful), { when = true }),
    key.press_mod('d', action.open_app_launcher(awful), { when = true }),
    key.press_mod('w', action.open_neorg_ws(awful, 'work'), { when = C.neorg }),
    key.press_mod('p', action.open_neorg_ws(awful, 'home'), { when = C.neorg }),

    -- awesome control
    key.press_shift_mod('l', awesome.quit, { when = true }),
    key.press_shift_mod('r', awesome.restart, { when = true }),

    -- workspace navigation
    key.press_one_of_mod('numrow', action.view_tags(awful), { when = true }),
    key.press_one_of_shift_mod('numrow', action.move_window(awful), { when = true }),
    key.press_mod('Tab', action.focus_window(awful, 1), { when = true }),
}

client.connect_signal('request::default_keybindings', function()
    awful.keyboard.append_client_keybindings {
        key.press_shift_mod('q', action.close_window, { when = true }),
        key.press_shift_mod('Return', action.toggle_fullscreen, { when = true }),
        key.press_shift_mod('space', action.toggle_float, { when = true }),
    }
end)
