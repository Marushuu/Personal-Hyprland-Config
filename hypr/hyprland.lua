local HOME = os.getenv("HOME")

package.path = package.path
    .. ";" .. HOME .. "/.config/hypr/?.lua"
    .. ";" .. HOME .. "/.config/hypr/plugins/split-monitor-workspaces/lua/?.lua"

-- Monitor Data --
hl.monitor({
    output = "DP-1",
    mode = "3440x1440@239.98Hz",
    position = "0x0",
    scale = 1,
    bitdepth = 10,
    vrr = 3,
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
    hl.exec_cmd("systemctl --user start hyprland-session.target")
    hl.exec_cmd("wl-paste --watch cliphist store")
    hl.exec_cmd("syncthing")
    hl.exec_cmd("hyprpm reload")
    hl.exec_cmd("quickshell")
    -- Wallpapers
    hl.exec_cmd(
        "swaybg -o DP-4 -i ~/Wallpapers/shorekeeper-wuthering-waves-wf.jpg -m fill -c C0CAF5")
    hl.exec_cmd(
        "mpvpaper -f -o '--input-ipc-server=/tmp/mpv-socket-DP-1 loop panscan=1.0 --mute=yes' DP-1 ~/Wallpapers/Denia1.mp4")
    hl.exec_cmd('mpvpaper-stop -f -p /tmp/mpv-socket-DP-1')
    -- Applications
    hl.exec_cmd("steam & vesktop")
    hl.exec_cmd("spotify-launcher")
end)

-- On Shutdown --
hl.on("hyprland.shutdown", function()
    os.execute("systemctl --user stop hyprland-session.target && sleep 0.1")
end)

-- Require Modules

local modules = {
    "hyprland/env",
    "hyprland/looks",
    "hyprland/inputs",
    "hyprland/misc",
    "hyprland/rules",
    "hyprland/keybinds",
}

for _, module in ipairs(modules) do
    require(module)
end
