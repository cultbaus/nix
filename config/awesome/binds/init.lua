local action = require 'binds.action'
local binds = require 'binds.binds'
local key = require 'binds.key'
local mouse = require 'binds.mouse'

local M = {}

function M.init(awful)
    binds.setup {
        awful = awful,
        action = action,
        key = key(awful),
        mouse = mouse(awful),
    }
end

return M
