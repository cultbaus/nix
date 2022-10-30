return function(awful)
    local m = {}

    function m.press_mod(key, action, opts)
        if opts.when then
            return awful.key({ C.modkey }, key, action)
        end
    end

    function m.press_ctrl(key, action, opts)
        if opts.when then
            return awful.key({ 'Control' }, key, action)
        end
    end

    function m.press_alt(key, action, opts)
        if opts.when then
            return awful.key({ C.altkey }, key, action)
        end
    end

    function m.press_shift_mod(key, action, opts)
        if opts.when then
            return awful.key({ C.modkey, 'Shift' }, key, action)
        end
    end

    function m.press_one_of_mod(keygroup, action, opts)
        if opts.when then
            return awful.key {
                modifiers = { C.modkey },
                keygroup = keygroup,
                on_press = action,
            }
        end
    end

    function m.press_one_of_shift_mod(keygroup, action, opts)
        if opts.when then
            return awful.key {
                modifiers = { C.modkey, 'Shift' },
                keygroup = keygroup,
                on_press = action,
            }
        end
    end

    return m
end
