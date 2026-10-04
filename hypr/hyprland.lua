-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- HYPRLAND CONFIG — witty@arch / Machcreator One R5
-- Minimal animations · Firefox · VK · Camera · LocalSend · TTT
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --


------------------
---- MONITORS ----
------------------

hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})


---------------------
---- MY PROGRAMS ----
---------------------

local terminal    = "kitty"
local fileManager = "pcmanfm-qt"
local browser     = "firefox"
local menu        = "hyprlauncher"
local messenger   = "vk-messenger"
local camera      = "guvcview"
local calculator  = "gnome-calculator"
local notes       = "obsidian"
local localsend   = "localsend"
local editor      = "kitty -e ttt"
local launcher    = "noctalia msg panel-toggle launcher"


-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function ()
    hl.exec_cmd("noctalia")
end)


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- Курсор: Katana Glow
hl.env("XCURSOR_THEME", "Katana Glow")
hl.env("HYPRCURSOR_THEME", "Katana Glow")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")


-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 20,

        border_size = 2,

        col = {
            active_border   = { colors = {"rgba(33ccffee)", "rgba(00ff99ee)"}, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },

        resize_on_border = false,
        allow_tearing    = false,
        layout           = "dwindle",
    },

    decoration = {
        rounding       = 10,
        rounding_power = 2,

        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        dim_special = 0.1,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled  = true,
            size     = 3,
            passes   = 1,
            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})

hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

-- ============ МИНИМАЛЬНЫЕ АНИМАЦИИ ============
hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 6.0,  bezier = "almostLinear" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.0,  bezier = "quick" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.0,  bezier = "quick",  style = "popin 95%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 3.0,  bezier = "quick",  style = "popin 95%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 3.0,  bezier = "quick" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 3.0,  bezier = "quick" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.0,  bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.0,  bezier = "quick" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 3.0,  bezier = "quick",  style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 3.0,  bezier = "quick",  style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 3.0,  bezier = "quick" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 3.0,  bezier = "quick" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 3.0,  bezier = "linear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 3.0,  bezier = "linear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 3.0,  bezier = "linear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })
-- ==============================================

hl.config({
    dwindle = {
        preserve_split = true,
    },
})

hl.config({
    master = {
        new_status = "master",
    },
})

hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})


----------------
----  MISC  ----
----------------

hl.config({
    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo   = false,
    },
})


---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "us,ru",
        kb_variant = "",
        kb_model   = "",
        kb_options = "grp:alt_shift_toggle",
        kb_rules   = "",

        follow_mouse = 1,
        sensitivity  = 0,

        touchpad = {
            natural_scroll = false,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})


---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"

-- === Приложения ===
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))     -- kitty
hl.bind(mainMod .. " + B",      hl.dsp.exec_cmd(browser))      -- firefox
hl.bind(mainMod .. " + F",      hl.dsp.exec_cmd(fileManager))  -- dolphin
hl.bind(mainMod .. " + R",      hl.dsp.exec_cmd(menu))         -- hyprlauncher
hl.bind(mainMod .. " + V",      hl.dsp.exec_cmd(messenger))    -- VK Messenger
hl.bind(mainMod .. " + C",      hl.dsp.exec_cmd(camera))       -- камера
hl.bind(mainMod .. " + L",      hl.dsp.exec_cmd(localsend))    -- LocalSend
hl.bind(mainMod .. " + E",      hl.dsp.exec_cmd(editor))       -- TTT editor
hl.bind(mainMod .. " + SPACE",  hl.dsp.exec_cmd(launcher))     -- Noctalia Launcher

-- === Окна ===
hl.bind(mainMod .. " + X",         hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P",         hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J",         hl.dsp.layout("togglesplit"))

-- === Скриншоты ===
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd("sh -c 'mkdir -p ~/Pictures/Screenshots && FILE=~/Pictures/Screenshots/$(date +%Y-%m-%d_%H-%M-%S).png && grim -g \"$(slurp)\" \"$FILE\" && wl-copy < \"$FILE\" && notify-send -i \"$FILE\" \"Скриншот\" \"Сохранён: $(basename $FILE)\"'"))
hl.bind(mainMod .. " + SHIFT + Z", hl.dsp.exec_cmd("sh -c 'mkdir -p ~/Pictures/Screenshots && FILE=~/Pictures/Screenshots/$(date +%Y-%m-%d_%H-%M-%S)_full.png && grim \"$FILE\" && wl-copy < \"$FILE\" && notify-send -i \"$FILE\" \"Скриншот (весь экран)\" \"$(basename $FILE)\"'"))

-- === Scratchpad: терминал (Super+S) ===
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- === Scratchpad: калькулятор (Super+Shift+K) ===
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.workspace.toggle_special("calc"))

-- === Scratchpad: заметки (Super+Shift+N) ===
hl.bind(mainMod .. " + SHIFT + N", hl.dsp.workspace.toggle_special("notes"))

-- === Выход ===
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))

-- === Фокус стрелками ===
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- === Воркспейсы 1..6 ===
for i = 1, 6 do
    hl.bind(mainMod .. " + " .. i,         hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end

-- === Скролл по воркспейсам ===
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- === Мышь ===
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- === Мультимедиа ===
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})

hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },
    move  = "20 monitor_h-120",
    float = true,
})

hl.window_rule({
    name    = "firefox-opacity",
    match   = { class = "firefox" },
    opacity = "0.95 0.90",
})

hl.window_rule({
    name  = "camera-float",
    match = { class = "guvcview" },
    float = true,
})


-------------------------------
---- SCRATCHPAD WORKSPACES ----
-------------------------------

hl.workspace_rule({
    workspace         = "special:magic",
    on_created_empty  = "kitty --class scratchpad-term",
})

hl.window_rule({
    name  = "scratchpad-term-float",
    match = { class = "scratchpad-term" },
    float = true,
    size  = "70% 60%",
    move  = "15% 20%",
})

hl.workspace_rule({
    workspace         = "special:calc",
    on_created_empty  = calculator,
})

hl.window_rule({
    name  = "scratchpad-calc-float",
    match = { class = "gnome-calculator" },
    float = true,
    size  = "30% 50%",
    move  = "35% 25%",
})

hl.workspace_rule({
    workspace         = "special:notes",
    on_created_empty  = notes,
})

hl.window_rule({
    name  = "scratchpad-notes-float",
    match = { class = "obsidian" },
    float = true,
    size  = "70% 70%",
    move  = "15% 15%",
})

-------------------------------


-- For Noctalia Color templates
require("noctalia").apply_theme()
