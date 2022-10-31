local naughty = require 'naughty'
local awful = require 'awful'

if awesome.startup_errors then
    naughty.notify {
        preset = naughty.config.presets.critical,
        title = 'error during startup',
        text = awesome.startup_errors,
    }
end

C = {
    terminal = 'alacritty',
    browser = 'firefox',
    editor = os.getenv 'EDITOR' or 'nvim',
    app_launcher_cmd = 'dmenu_run',
    modkey = 'Mod4',
    altkey = 'Mod1',
    neorg = true,
}

require 'awful.autofocus'
require 'binds'
require 'rules'
require 'theme'
require 'signals'

awful.spawn.with_shell '~/.config/awesome/autostart'
