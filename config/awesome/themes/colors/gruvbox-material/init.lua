local path = require('gears').filesystem.get_configuration_dir() .. 'themes/colors/gruvbox-material/'

local m = {}

m.bg = '#1d2021'
m.fg = '#d4be98'
m.black = '#32302f'
m.red = '#ea6962'
m.green = '#a9b665'
m.yellow = '#d8a657'
m.blue = '#7daea3'
m.magenta = '#d3869b'
m.cyan = '#89b482'
m.white = '#d4be98'

m.bg_alt = m.black
m.urgent = m.red

m.font = 'JetBrainsMono 14'
m.wall = path .. 'cabin.png'

return m
