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

    # -------------------------------------------------------------------
    # 一般的なユーティリティ
    # -------------------------------------------------------------------
    # Ctrl+hをBackspaceにする
    keymap_global["C-H"] = "Back"

    # 左右のCtrlをIME切り替えにする
    keymap_global["O-LCtrl"] = lambda: keymap.wnd.setImeStatus(0)
    keymap_global["O-RCtrl"] = lambda: keymap.wnd.setImeStatus(1)

    # EscapeでIMEをOFFにする
    def esc():
        keymap.InputKeyCommand("Esc")
        keymap.wnd.setImeStatus(0)

    keymap_global["O-ESC"] = esc

    # Clipboard history related
    keymap_global["C-S-Z"] = (
        keymap.command_ClipboardList
    )  # Open the clipboard history list
    keymap_global["C-S-X"] = (
        keymap.command_ClipboardRotate
    )  # Move the most recent history to tail
    keymap_global["C-S-A-X"] = (
        keymap.command_ClipboardRemove
    )  # Remove the most recent history
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
