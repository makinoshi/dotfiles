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

    # 設定値
    isJISKeyboard = False  # JISキーボードかどうか
    modifiers = []  # モディファイアのリスト

    # 無変換と変換をモディファイアにする
    if isJISKeyboard:
        keymap.replaceKey("(29)", 235)  # 無変換
        keymap.replaceKey("(28)", 236)  # 変換
        keymap.defineModifier(235, "User0")
        keymap.defineModifier(236, "User1")
        modifiers = ["U0-", "U1-"]
    else:
        keymap.replaceKey("Space", 235)
        keymap.defineModifier(235, "User0")
        modifiers = ["U0-"]

    # Global keymap which affects any windows
    keymap_global = keymap.defineWindowKeymap()

    # モディファイアにしたキーにワンショットモディファイアを割り当てる
    if isJISKeyboard:
        # 無変換と変換をワンショットモディファイアでIMEの有効無効を切り替える
        keymap_global["O-(235)"] = lambda: keymap.wnd.setImeStatus(0)
        keymap_global["O-(236)"] = lambda: keymap.wnd.setImeStatus(1)
    else:
        # Spaceをワンショットモディファイアでスペースに戻す
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
            keymap_global["O-" + modifier_prefix + "(235)"] = modifier_prefix + "Space"

    # 移動
    for modifier in modifiers:
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
            "W-A-S-",
            "W-A-C-",
            "W-A-C-S-",
        ):
            for k, v in {
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
                keymap_global[modifier_prefix + modifier + k] = modifier_prefix + v

    # 単語移動
    for modifier in modifiers:
        for modifier_prefix in ("", "S-"):
            keymap_global[modifier_prefix + modifier + "W"] = (
                modifier_prefix + "C-Right"
            )
            keymap_global[modifier_prefix + modifier + "B"] = modifier_prefix + "C-Left"

    # Backspace
    keymap_global["U0-H"] = "Back"
    keymap_global["U0-LC-H"] = "LC-Back"

    # Delete
    keymap_global["U0-X"] = "Delete"
    keymap_global["U0-LS-D"] = "S-End", "C-X"
    keymap_global["U0-D"] = keymap.defineMultiStrokeKeymap("d: kill line, w: kill word")
    keymap_global["U0-D"]["U0-D"] = "Home", "Home", "S-Down", "C-x"
    keymap_global["U0-D"]["U0-W"] = "C-S-Right", "C-x"

    # Undo/Redo
    keymap_global["U0-Z"] = "C-Z"
    keymap_global["U0-Y"] = "C-Y"

    # LCtrlのワンショットモディファイアでF21を送信する。VSCodeではwhichkeyが起動する
    keymap_global["O-LCtrl"] = "(132)"

    # ESC
    if isJISKeyboard:
        keymap_global["U0-Plus"] = "ESC"
    else:
        keymap_global["U0-Semicolon"] = "ESC"

    # Space
    if not isJISKeyboard:
        keymap_global["U0-S"] = "Space"
        keymap_global["U0-S-S"] = "S-Space"

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
