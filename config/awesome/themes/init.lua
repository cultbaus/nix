local ui = require 'themes.ui'
local theme = require 'themes.theme'

local M = {}

function M.init(awful, beautiful, wibox)
    beautiful.init(theme.init(beautiful))

    ui.init(awful, beautiful, wibox)
end

return M
