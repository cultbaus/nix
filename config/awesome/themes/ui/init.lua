local title = require 'themes.ui.title'
local notification = require 'themes.ui.notification'

local M = {}

function M.init(awful, beautiful, naughty, ruled, wibox)
    title.init(awful, beautiful, wibox)
    notification.init(awful, beautiful, naughty, ruled, wibox)
end

return M
