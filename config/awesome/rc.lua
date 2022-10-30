-- Unmuting audio before the volume signal is emitted will fix errors on startup.
-- require("awful").spawn.with_shell("pactl set-sink-mute @DEFAULT_SINK@ 0")

-- Define defaults
c = {}

c.terminal = "alacritty"
c.browser = "firefox"
c.files = "nautilus"
c.editor = os.getenv("EDITOR") or "nvim"
c.editor_cmd = c.terminal .. " -e " .. c.editor
c.modkey = "Mod4"

-- global config options
C = {
    terminal = "alacritty",
    browser = "firefox",
    editor = os.getenv("EDITOR") or "nvim",
    app_launcher_cmd = "dmenu_run",
    modkey = "Mod4",
    altkey = "Mod1",
    neorg = true,
}

-- Config
require("awful.autofocus")
require("themes.linear")
require("config")
require("signals")
