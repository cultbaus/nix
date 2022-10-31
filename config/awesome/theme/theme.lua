local beautiful = require 'beautiful'
local dpi = beautiful.xresources.apply_dpi

local theme = {}

theme.useless_gap = dpi(10)
theme.border_width = dpi(0)

return theme
