local M = {}

function M.init(gears, beautiful)
    local theme_path = gears.filesystem.get_configuration_dir() .. 'themes/theme.lua'
    beautiful.init(theme_path)

    require 'themes.ui'
end

return M
