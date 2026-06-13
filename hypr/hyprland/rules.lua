-- Center Floats
hl.window_rule({
    match = {
        float = true
    },
    center = true
})

-- Floats
hl.window_rule({ match = { class = "yad" }, float = true })
hl.window_rule({ match = { class = "zenity" }, float = true })
hl.window_rule({ match = { class = "blueman-manager" }, float = true })
hl.window_rule({ match = { class = "nm-connection-editor" }, float = true })
hl.window_rule({ match = { class = "org.pulseaudio.pavucontrol" }, float = true })
hl.window_rule({ match = { class = "nwg-look" }, float = true })
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

-- Special Workspace
hl.window_rule({ match = { class = "spotify" }, workspace = "special:music" })
