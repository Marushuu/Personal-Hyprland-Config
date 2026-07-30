hl.config({
    general = {
        border_size = 1,

        gaps_in = 5,
        gaps_out = 10,
        float_gaps = 5,

        -- Colors
        col = {
            inactive_border = "rgba(474747AA)",
            active_border = "rgba(919191AA)"
        },

        layout = "master",

        resize_on_border = true,
        no_focus_fallback = true,
    },
    decoration = {
        rounding = 5,

        blur = {
            enabled = true,
            size = 3,
            passes = 3,
            vibrancy = 0.1696,
            popups = true,
            input_methods = true,
        },
        shadow = {
            enabled = true,
            range = 5,
        }
    },
    animations = {
        enabled = true,
    },
    master = {
        allow_small_split = true,
        new_on_top = true,
        orientation = "left",
    },
    dwindle = {
        preserve_split = true,
        smart_split = true,
    }
})

hl.animation({ leaf = "specialWorkspaceIn", enabled = true, speed = 4, bezier = "default", style = "slidevert" })
hl.animation({ leaf = "specialWorkspaceOut", enabled = true, speed = 8, bezier = "default", style = "slidevert" })

-- Terminal
hl.window_rule({ match = { class = "kitty" }, opacity = "0.95" })
hl.window_rule({ match = { class = "Spotify" }, opacity = "0.85" })
