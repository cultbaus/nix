local ui = require 'themes.ui'
local theme = require 'themes.theme'

local M = {}

function M.init(awful, beautiful, naughty, ruled, wibox)
    beautiful.init(theme.init(beautiful))

    ui.init(awful, beautiful, naughty, ruled, wibox)
end

return M
