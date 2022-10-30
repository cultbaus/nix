local path = (...):gsub("%.init%", "")

local awful = require("awful")

local action = require(path .. ".action")
local key = require(path .. ".key")(awful)

awful.keyboard.append_global_keybindings({
    -- application control
    key.press("Return", action.open_terminal(awful), { description = "open a terminal", group = "awesome" }),
    key.press("l", action.open_browser(awful), { description = "open browser", group = "awesome" }),
    key.press("d", action.open_app_launcher(awful), { description = "run application launcher", group = "awesome" }),

    -- awesome control

    -- workspace navigation
    key.press_one_of("numrow", action.view_tags(awful), { description = "view tag", group = "tag" }),
})

client.connect_signal("request::default_keybindings", function()
    awful.keyboard.append_client_keybindings({
        key.press_shift("q", action.close_window, { description = "close", group = "client" }),
    })
end)
