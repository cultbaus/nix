return function(awful)
    local m = {}

    function m.press(key, action, opts)
        return awful.key({ C.modkey }, key, action, opts)
    end

    function m.press_shift(key, action, opts)
        return awful.key({ C.modkey, "Shift" }, key, action, opts)
    end

    function m.press_one_of(keygroup, action, opts)
        return awful.key({
            modifiers = { C.modkey },
            keygroup = keygroup,
            description = opts.description,
            group = opts.group,
            on_press = action,
        })
    end

    return m
end
