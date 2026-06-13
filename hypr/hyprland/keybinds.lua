local mainMod = "SUPER"
package.path = package.path .. ";/home/marushu/.config/hypr/plugins/split-monitor-workspaces/lua/?.lua"
local smw = require("split-monitor-workspaces")

-- Programs
local terminal = "kitty"
local browser = "zen-browser"
local editor = "code"
local fileExplorer = "thunar"
local appLauncher = "rofi -show drun"

-- Split Monitor Workspaces
smw.setup({
    workspace_count = 5,
    monitor_priority = { "DP-3", "DP-4" },
    keep_focused = true,
    enable_wrapping = true,
})

-- Session
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("loginctl lock-session"))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd("systemctl suspend"))
hl.bind(mainMod .. " + CTRL + SHIFT + ALT + Delete", hl.dsp.exec_cmd("systemctl poweroff"))

-- Apps
hl.bind(mainMod .. " + Grave", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileExplorer))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(appLauncher))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(editor))

-- Media
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, repeating = true })

-- Brightness - doesn't really work for my case but for my laptop
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Clipboard
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("cliphist list | rofi -dmenu | cliphist decode | wl-copy"))

-- Screenshot
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("grimblast copysave area"))
hl.bind(mainMod .. " + CTRL + SHIFT + S", hl.dsp.exec_cmd("grimblast copysave screen"))

--- Window
-- Interactions
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind("ALT + F4", hl.dsp.window.close())
hl.bind(mainMod .. " + ALT + Space", hl.dsp.window.float())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized" }))
hl.bind(mainMod .. " + CTRL + F", hl.dsp.window.fullscreen({ mode = "fullscreen" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pin())

-- Mouse Binds
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind(mainMod .. " + mouse:274", hl.dsp.window.drag(), { mouse = true, drag = true })
hl.bind(mainMod .. " + mouse:274", hl.dsp.window.float(), { mouse = true, click = true })

-- Focus
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))

hl.bind(mainMod .. " + Left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + Right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + Up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + Down", hl.dsp.focus({ direction = "down" }))

-- Movement
hl.bind(mainMod .. " + SHIFT + Left", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + Right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + Up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + Down", hl.dsp.window.move({ direction = "down" }))

-- Resize
hl.bind(mainMod .. " + Semicolon", hl.dsp.window.resize({ x = -0.1, y = 0 }))
hl.bind(mainMod .. " + Apostrophe", hl.dsp.window.resize({ x = 0.1, y = 0 }))

-- Specials
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("music"))

--- Workspaces
-- Movement
hl.bind(mainMod .. " + CTRL + Left", smw.cycle_workspaces("prev"))
hl.bind(mainMod .. " + CTRL + Right", smw.cycle_workspaces("next"))
hl.bind(mainMod .. " + CTRL + mouse_down", smw.cycle_workspaces("prev"))
hl.bind(mainMod .. " + CTRL + mouse_up", smw.cycle_workspaces("next"))

hl.bind(mainMod .. " + ALT + Left", smw.move_to_workspace("prev"))
hl.bind(mainMod .. " + ALT + Right", smw.move_to_workspace("next"))
hl.bind(mainMod .. " + ALT + mouse_down", smw.move_to_workspace("prev"))
hl.bind(mainMod .. " + ALT + mouse_up", smw.move_to_workspace("next"))

for i = 1, smw.get_amount_of_workspaces() do
    local n = tostring(i)
    if n == "10" then n = "0" end
    hl.bind(mainMod .. " +" .. n, smw.workspace(n))
    hl.bind(mainMod .. " + SHIFT +" .. n, smw.move_to_workspace_silent(n))
end

-- Grab Rogue
hl.bind(mainMod .. " + SHIFT + G", smw.grab_rogue_windows())
