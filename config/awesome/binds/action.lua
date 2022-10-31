local M = {}

-- open a terminal
function M.open_terminal(awful)
    return function()
        awful.spawn(C.terminal)
    end
end

-- open editor
function M.open_editor(awful)
    return function()
        awful.spawn(C.terminal .. ' -e ' .. C.editor)
    end
end

-- open editor in neorg workspace
function M.open_neorg_ws(awful, workspace)
    return function()
        local cmd = C.terminal .. ' -e ' .. C.editor .. ' -c ' .. '"' .. 'Neorg workspace ' .. workspace .. '"'
        awful.spawn(cmd)
    end
end

-- open a browser
function M.open_browser(awful)
    return function()
        awful.spawn(C.browser)
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

-- jump to tag n [1 - 10]
function M.view_tags(awful)
    return function(index)
        local i = index == 0 and 10 or index
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
            tag:view_only()
        end
    end
end

-- move window to tag n [1 - 10]
function M.move_window()
    return function(index)
        if client.focus then
            local i = index == 0 and 10 or index -- i love lua
            local tag = client.focus.screen.tags[i]
            if tag then
                client.focus:move_to_tag(tag)
            end
        end
    end
end

-- focus window by index
function M.focus_window(awful, index)
    return function()
        awful.client.focus.byidx(index)
    end
end

-- toggle fullscreen window
function M.toggle_fullscreen(w)
    w.fullscreen = not w.fullscreen
    w:raise()
end

-- toggle floating window
function M.toggle_float(w)
    w.floating = not w.floating
    w:raise()
end

-- take a screenhot (requires maim and xclip)
function M.take_screenhot(awful)
    return function()
        awful.spawn.with_shell 'screenshot'
    end
end

-- adjust volume - requires pulseaudio (for pactl, not required to be enabled)
local function adjust_volume(awful, unit)
    awful.spawn.with_shell 'pactl set-sink-mute @DEFAULT_SINK@ 0'
    awful.spawn.with_shell('pactl set-sink-volume @DEFAULT_SINK@ ' .. unit)
end

-- adjust brightness, requires brightnessctl
local function adjust_brightness(awful, unit)
    awful.spawn.with_shell('brightnessctl -q s ' .. unit)
end

function M.raise_volume(awful)
    return function()
        adjust_volume(awful, '+5%')
    end
end

function M.lower_volume(awful)
    return function()
        adjust_volume(awful, '-5%')
    end
end

function M.mute_volume(awful)
    return function()
        awful.spawn.with_shell 'pactl set-sink-mute @DEFAULT_SINK@ toggle'
    end
end

function M.raise_brightness(awful)
    return function()
        adjust_brightness(awful, '5%+')
    end
end

function M.lower_brightness(awful)
    return function()
        adjust_brightness(awful, '5%-')
    end
end

return M
