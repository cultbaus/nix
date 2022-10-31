local awful = require 'awful'
local action = require 'binds.action'
local binds = require 'binds.binds'
local key = require 'binds.key'
local mouse = require 'binds.mouse'

binds.setup {
    awful = awful,
    action = action,
    key = key(awful),
    mouse = mouse(awful),
}
