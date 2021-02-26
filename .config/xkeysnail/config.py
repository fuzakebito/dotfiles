import re
from xkeysnail.transform import *

define_modmap({
    Key.RIGHT_CTRL: Key.LEFT_CTRL,
    Key.KATAKANAHIRAGANA: Key.ENTER,
})

define_multipurpose_modmap({
    Key.CAPSLOCK: [Key.ESC, Key.RIGHT_CTRL],
    Key.HENKAN: [Key.HENKAN, Key.LEFT_SHIFT],
    Key.MUHENKAN: [Key.MUHENKAN, Key.LEFT_CTRL],
    Key.SEMICOLON: [Key.SEMICOLON, Key.RIGHT_META],
})

define_keymap(None, {
    # Vim-like
    K("RC-h"): K("Left"),
    K("RC-j"): K("Down"),
    K("RC-k"): K("Up"),
    K("RC-l"): K("Right"),
    K("RC-LC-h"): K("Shift-Left"),
    K("RC-LC-j"): K("Shift-Down"),
    K("RC-LC-k"): K("Shift-Up"),
    K("RC-LC-l"): K("Shift-Right"),
    K("RC-M-h"): K("C-Shift-Left"),
    K("RC-M-j"): K("C-Shift-Down"),
    K("RC-M-k"): K("C-Shift-Up"),
    K("RC-M-l"): K("C-Shift-Right"),
    K("RC-d"): K("backspace"),
    K("RC-r"): K("Enter"),
    K("RC-f"): K("Alt-Right"),
    K("RC-b"): K("Alt-Left"),
    K("RC-a"): K("home"),
    K("RC-e"): K("end"),
})
