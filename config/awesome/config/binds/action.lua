local M = {}

-- open a terminal
function M.open_terminal(awful)
    return function()
        awful.spawn(C.terminal)
    end
end

-- open app launcher
function M.open_app_launcher(awful)
    return function()
        awful.spawn(C.app_launcher_cmd)
    end
end

-- close current window
function M.close_window(client)
    client:kill()
end

-- jump to tag n [0 - 9]
function M.view_tags(awful)
    return function(index)
        local screen = awful.screen.focused()
        local tag = screen.tags[index]
        if tag then
            tag:view_only()
        end
    end
end

return M
