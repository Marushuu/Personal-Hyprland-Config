-- Monitor Data --
hl.monitor({
    output = "DP-3",
    mode = "3440x1440@239.98Hz",
    position = "0x0",
    scale = 1,
    bitdepth = 10,
    vrr = 0,
})

hl.monitor({
    output = "DP-4",
    mode = "1920x1080@60.00Hz",
    position = "auto-left",
    scale = 1,
    transform = 1
})

hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = 1
})

-- Auto Start --

hl.on("hyprland.start", function()
    hl.exec_cmd("swaync")
    hl.exec_cmd("/usr/lib/hyprpolkitagent/hyprpolkitagent")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("hyprpm reload")
    hl.exec_cmd("systemctl --user import-environment &")
    hl.exec_cmd("hash dbus-update-activation-environment 2>/dev/null &")
    hl.exec_cmd("dbus-update-activation-environment --systemd &")
    hl.exec_cmd("steam & spotify-launcher & vesktop")
    h1.exec_cmd("wl-paste --watch cliphist store")
end)

require("hyprland/env")
require("hyprland/looks")
require("hyprland/misc")
require("hyprland/inputs")
require("hyprland/keybinds")
require("hyprland/rules")
