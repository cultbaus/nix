local M = {}

function M.init(awful, beautiful, wibox)
    local dpi = beautiful.xresources.apply_dpi
    local function mouse_click(c, mod, button, action)
        return awful.button(mod or {}, button, function()
            c:activate { context = 'titlebar', action = action }
        end)
    end

    client.connect_signal('request::titlebars', function(c)
        awful
            .titlebar(c, {
                size = dpi(44.5),
            })
            :setup {
                {
                    {
                        align = 'center',
                        widget = awful.titlebar.widget.titlewidget(c),
                    },
                    buttons = {
                        mouse_click(c, nil, 1, 'mouse_move'),
                        mouse_click(c, { 'Shift' }, 1, 'mouse_resize'),
                        mouse_click(c, nil, 3, 'mouse_resize'),
                    },
                    layout = wibox.layout.flex.horizontal,
                },
                layout = wibox.layout.stack,
            }
    end)
end

return M
