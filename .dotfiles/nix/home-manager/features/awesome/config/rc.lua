require 'awful.autofocus'

local awful = require 'awful'
local beautiful = require 'beautiful'
local naughty = require 'naughty'
local ruled = require 'ruled'
local wibox = require 'wibox'

local binds = require 'binds'
local rules = require 'rules'
local signals = require 'signals'
local themes = require 'themes'

if awesome.startup_errors then
    naughty.notify {
        preset = naughty.config.presets.critical,
        title = 'error during startup',
        text = awesome.startup_errors,
    }
end

local dmenu = false
local rofi = true
GLOBAL_CONFIG = {
    -- opts
    dmenu = dmenu,
    rofi = rofi,
    neorg = true,

    -- apps
    app_launcher_cmd = dmenu and 'dmenu_run' or 'rofi -show drun -display-drun " "',
    terminal = 'alacritty',
    browser = 'firefox',
    editor = os.getenv 'EDITOR' or 'nvim',

    -- theme color
    theme = 'gruvbox-material',

    -- key
    modkey = 'Mod4',
    altkey = 'Mod1',
}

themes.init(awful, beautiful, naughty, ruled, wibox)
signals.init(awful, beautiful, naughty, wibox)
rules.init(awful, ruled)
binds.init(awful)

awful.spawn.with_shell '~/.config/awesome/autostart'
