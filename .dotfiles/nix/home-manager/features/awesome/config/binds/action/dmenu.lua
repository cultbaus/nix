local color = require 'themes.colors.gruvbox-material' -- for some reason i can't access the global config here
local m = {}

local function with_quotes(s)
    return '"' .. s .. '"'
end

local with_colors = ' -nb '
    .. with_quotes(color.bg)
    .. ' -nf '
    .. with_quotes(color.fg)
    .. ' -sb '
    .. with_quotes(color.bg)
    .. ' -sf '
    .. with_quotes(color.fg)
    .. ' -fn '
    .. with_quotes(color.font)

function m.run(awful)
    local cmd = 'dmenu_run' .. with_colors
    return function()
        awful.spawn.with_shell(cmd)
    end
end

function m.ddg(awful)
    return function()
        awful.spawn.with_shell 'ddg'
    end
end

return m
