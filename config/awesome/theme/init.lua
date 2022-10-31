local beautiful = require 'beautiful'
local gears = require 'gears'
local theme_path = gears.filesystem.get_configuration_dir() .. 'theme/theme.lua'

beautiful.init(theme_path)
