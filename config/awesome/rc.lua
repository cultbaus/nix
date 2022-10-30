local awful = require 'awful'

C = {}

C.terminal = 'alacritty'
C.browser = 'firefox'
C.mod = 'Mod4'

awful.keyboard.append_global_keybindings {
    awful.key({ C.mod, 'Shift' }, 'r', awesome.restart, { description = 'reload awesome', group = 'awesome' }),
    awful.key({}, 'Return', function()
        awful.spawn(C.terminal)
    end, { description = 'open terminal', group = 'launcher' }),
}
