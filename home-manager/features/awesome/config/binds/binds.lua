local M = {}

function M.setup(opt)
    opt.awful.keyboard.append_global_keybindings {
        -- application control
        opt.key.press_mod('Return', opt.action.open_terminal(opt.awful), { when = true }),
        opt.key.press_mod('d', opt.action.open_app_launcher(opt.awful), { when = true }),
        opt.key.press_mod('s', opt.action.send_notif(opt.awful), { when = GLOBAL_CONFIG.neorg }),
        opt.key.press_mod('l', opt.action.open_browser(opt.awful), { when = true }),
        opt.key.press_mod('k', opt.action.open_editor(opt.awful), { when = true }),
        opt.key.press_mod('w', opt.action.open_neorg_ws(opt.awful, 'work'), { when = GLOBAL_CONFIG.neorg }),
        opt.key.press_mod('p', opt.action.open_neorg_ws(opt.awful, 'home'), { when = GLOBAL_CONFIG.neorg }),

        -- awesome control
        opt.key.press_shift_mod('l', awesome.quit, { when = true }),
        opt.key.press_shift_mod('r', awesome.restart, { when = true }),

        -- workspace navigation
        opt.key.press_one_of_mod('numrow', opt.action.view_tags(opt.awful), { when = true }),
        opt.key.press_one_of_shift_mod('numrow', opt.action.move_window(opt.awful), { when = true }),
        opt.key.press_mod('Tab', opt.action.focus_window(opt.awful, 1), { when = true }),

        -- misc
        opt.key.press_key('Print', opt.action.take_screenhot(opt.awful), { when = true }),
        opt.key.press_key('XF86AudioRaiseVolume', opt.action.raise_volume(opt.awful), { when = true }),
        opt.key.press_key('XF86AudioLowerVolume', opt.action.lower_volume(opt.awful), { when = true }),
        opt.key.press_key('XF86AudioMute', opt.action.mute_volume(opt.awful), { when = true }),
        opt.key.press_key('XF86MonBrightnessUp', opt.action.raise_brightness(opt.awful), { when = true }),
        opt.key.press_key('XF86MonBrightnessDown', opt.action.lower_brightness(opt.awful), { when = true }),
    }

    opt.awful.mouse.append_global_mousebindings {
        opt.mouse.left_click(opt.action.hide_rootmenu),
        opt.mouse.right_click(opt.action.toggle_rootmenu),
    }

    client.connect_signal('request::default_keybindings', function()
        opt.awful.keyboard.append_client_keybindings {
            opt.key.press_shift_mod('q', opt.action.close_window, { when = true }),
            opt.key.press_shift_mod('Return', opt.action.toggle_fullscreen, { when = true }),
            opt.key.press_shift_mod('space', opt.action.toggle_float, { when = true }),
        }
    end)
end

return M
