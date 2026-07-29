-- Floats
hl.window_rule({ match = { class = "yad" }, float = true })
hl.window_rule({ match = { class = "zenity" }, float = true })
hl.window_rule({ match = { class = "blueman-manager" }, float = true, center = true, size = { 550, 350 } })
hl.window_rule({ match = { class = "nm-connection-editor" }, float = true, center = true })
hl.window_rule({ match = { class = "org.pulseaudio.pavucontrol" }, float = true, center = true, size = { 1200, 800 } })
hl.window_rule({ match = { class = "nwg-look" }, float = true, center = true, size = { 1200, 800 } })
hl.window_rule({ match = { class = "paradox-launcher-v2" }, float = true })
hl.window_rule({ match = { class = "RimSort" }, float = true })
hl.window_rule({ match = { class = "forzarichpresence" }, float = true })
hl.window_rule({
    match = {
        class = "^(steam)$",
        title = "negative:^(Steam)$"
    },
    float = true
})
-- Dialogs
hl.window_rule({ match = { title = "(Select|Open)( a)? (File|Folder)(s)?" }, float = true })
hl.window_rule({ match = { title = "File (Operation|Upload)( Progress)?" }, float = true })
hl.window_rule({ match = { title = ".* Properties" }, float = true })
hl.window_rule({ match = { title = "Export Image as PNG" }, float = true })
hl.window_rule({ match = { title = "Save As" }, float = true })
hl.window_rule({ match = { title = "Library" }, float = true })

-- Terminal
hl.window_rule({ match = { class = "kitty" }, opacity = "0.95" })

-- Special Workspace
hl.window_rule({ match = { class = "Spotify" }, workspace = "special:music" })

-- Vertical Monitor Stuff
hl.workspace_rule({ workspace = "m[DP-4]", layout_opts = { orientation = "top" } })
-- hl.workspace_rule({ workspace = "m[DP-4]", layout = "Dwindle" })

-- Workspace Rules
-- hl.workspace_rule({ workspace = "1", monitor = "DP-1", default = true })
-- hl.workspace_rule({ workspace = "2", monitor = "DP-1", default = true })
-- hl.workspace_rule({ workspace = "3", monitor = "DP-1", default = true })
-- hl.workspace_rule({ workspace = "4", monitor = "DP-1", default = true })

-- hl.workspace_rule({ workspace = "5", monitor = "DP-4", default = true })
-- hl.workspace_rule({ workspace = "6", monitor = "DP-4", default = true })
-- hl.workspace_rule({ workspace = "7", monitor = "DP-4", default = true })
-- hl.workspace_rule({ workspace = "8", monitor = "DP-4", default = true })
