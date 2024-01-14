import sys
import os
import datetime

import pyauto
from keyhac import *


def configure(keymap):
    # --------------------------------------------------------------------
    # Text editer setting for editting config.py file
    keymap.editor = "code"

    # --------------------------------------------------------------------
    # Customizing the display

    # Font
    keymap.setFont("Source Han Code JP", 12)

    # Theme
    keymap.setTheme("black")

    # --------------------------------------------------------------------
    # Key remap

    # Global keymap which affects any windows
    keymap_global = keymap.defineWindowKeymap()

    # 設定値
    isJISKeyboard = False  # JISキーボードかどうか

    # F13(0x7c)をモディファイアとして使う
    keymap.defineModifier("(124)", "User0")

    # スペースバーからCtrl, Alt, Winとなるようにする
    keymap.replaceKey("LAlt", "LCtrl")
    keymap.replaceKey("LWin", "LAlt")
    keymap.replaceKey("LCtrl", "LWin")
    keymap.replaceKey("RAlt", "RCtrl")
    keymap.replaceKey("RWin", "RAlt")
    keymap.replaceKey("RCtrl", "RWin")

    # スペースバーの隣のキーでIMEの有効無効を切り替える
    keymap_global["O-LCtrl"] = lambda: keymap.wnd.setImeStatus(0)
    keymap_global["O-RCtrl"] = lambda: keymap.wnd.setImeStatus(1)

    # カスタマイズ用のファンクションキー
    keymap_global["U0-Space"] = "(125)" # F14(VSCodeではVSpaceCode)
    keymap_global["U0-Comma"] = "(126)" # F15(VSCodeではVSpaceCodeのメジャーモードを起動)

    # 移動
    for modifier_prefix in (
        "",
        "S-",
        "C-",
        "C-S-",
        "A-",
        "A-S-",
        "A-C-",
        "A-C-S-",
        "W-",
        "W-S-",
        "W-C-",
        "W-C-S-",
        "W-A-",
        "W-A-S-"
        "W-A-C-",
        "W-A-C-S-",
    ):
        for key, key_name in {
            # 矢印キー
            "J": "Left",
            "K": "Down",
            "I": "Up",
            "L": "Right",
            # Home/End
            "A": "Home",
            "E": "End",
            # PageUp/PageDown
            "U": "PageUp",
            "O": "PageDown",
        }.items():
            keymap_global[modifier_prefix + "U0-" + key] = modifier_prefix + key_name

    # 単語移動
    for modifier_prefix in ("", "S-"):
        keymap_global[modifier_prefix + "U0-W"] = (
            modifier_prefix + "C-Right"
        )
        keymap_global[modifier_prefix + "U0-B"] = modifier_prefix + "C-Left"

    # Backspace
    keymap_global["U0-H"] = "Back"
    keymap_global["U0-C-H"] = "C-Back"

    # Delete
    keymap_global["U0-D"] = "Delete"
    keymap_global["U0-C-D"] = "C-Delete"

    # Undo/Redo
    keymap_global["U0-Z"] = "C-Z"
    keymap_global["U0-Y"] = "C-Y"

    # ESCとIMEオフ
    if isJISKeyboard:
        keymap_global["U0-Plus"] = "ESC", "(29)"
    else:
        keymap_global["U0-Semicolon"] = "ESC", "(29)"

    # Function keys
    for modifier_prefix in (
        "",
        "S-",
        "C-",
        "C-S-",
        "A-",
        "A-S-",
        "A-C-",
        "A-C-S-",
    ):
        keymap_global[modifier_prefix + "U0-1"] = modifier_prefix + "F1"
        keymap_global[modifier_prefix + "U0-2"] = modifier_prefix + "F2"
        keymap_global[modifier_prefix + "U0-3"] = modifier_prefix + "F3"
        keymap_global[modifier_prefix + "U0-4"] = modifier_prefix + "F4"
        keymap_global[modifier_prefix + "U0-5"] = modifier_prefix + "F5"
        keymap_global[modifier_prefix + "U0-6"] = modifier_prefix + "F6"
        keymap_global[modifier_prefix + "U0-7"] = modifier_prefix + "F7"
        keymap_global[modifier_prefix + "U0-8"] = modifier_prefix + "F8"
        keymap_global[modifier_prefix + "U0-9"] = modifier_prefix + "F9"
        keymap_global[modifier_prefix + "U0-0"] = modifier_prefix + "F10"
        keymap_global[modifier_prefix + "U0-Minus"] = modifier_prefix + "F11"
        keymap_global[modifier_prefix + "U0-Plus"] = modifier_prefix + "F12"

    # Ctrlとして動作させる
    keymap_global["U0-Tab"] = "C-Tab"
    keymap_global["U0-S-Tab"] = "C-S-Tab"

    # Clipboard history related
    keymap_global[
        "C-S-Z"
    ] = keymap.command_ClipboardList  # Open the clipboard history list
    keymap_global[
        "C-S-X"
    ] = keymap.command_ClipboardRotate  # Move the most recent history to tail
    keymap_global[
        "C-S-A-X"
    ] = keymap.command_ClipboardRemove  # Remove the most recent history
    keymap.quote_mark = "> "  # Mark for quote pasting

    # --------------------------------------------------------------------
    # Customizing clipboard history list
    if 0:
        # Enable clipboard monitoring hook (Default:Enabled)
        keymap.clipboard_history.enableHook(True)

        # Maximum number of clipboard history (Default:1000)
        keymap.clipboard_history.maxnum = 1000

        # Total maximum size of clipboard history (Default:10MB)
        keymap.clipboard_history.quota = 10 * 1024 * 1024
