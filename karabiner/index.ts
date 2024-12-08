import { map, rule, withMapper, writeToProfile } from "karabiner.ts";
import type { FunctionKeyCode } from "karabiner.ts";

// ! Change '--dry-run' to your Karabiner-Elements Profile name.
// (--dry-run print the config json into console)
// + Create a new profile if needed.
writeToProfile("Default profile", [
  // It is not required, but recommended to put symbol alias to layers,
  // (If you type fast, use simlayer instead, see https://evan-liu.github.io/karabiner.ts/rules/simlayer)
  // to make it easier to write '←' instead of 'left_arrow'.
  // Supported alias: https://github.com/evan-liu/karabiner.ts/blob/main/src/utils/key-alias.ts

  rule("左Ctrl,左Commandで英数、右Ctrl,右Commandでかな").manipulators([
    withMapper({
      left_control: "japanese_eisuu",
      left_command: "japanese_eisuu",
      right_command: "japanese_kana",
      right_control: "japanese_kana",
    } as const)((cmd, keyCode) =>
      map({ key_code: cmd, modifiers: { optional: ["any"] } })
        .to({ key_code: cmd, lazy: true })
        .toIfAlone({ key_code: keyCode })
        .parameters({ "basic.to_if_held_down_threshold_milliseconds": 100 })
    ),
  ]),
  rule("escを押したときに英数も押したことにする").manipulators([
    map({ key_code: "escape" }).to([
      { key_code: "escape" },
      { key_code: "japanese_eisuu" },
    ]),
  ]),
  rule("SpaceFnモードを作成").manipulators([
    map({ key_code: "spacebar" })
      .condition({
        name: "_spacefn_mode",
        type: "variable_if",
        value: 0,
      })
      .parameters({
        "basic.to_if_alone_timeout_milliseconds": 200,
        "basic.to_if_held_down_threshold_milliseconds": 10,
        "basic.to_delayed_action_delay_milliseconds": 100,
      })
      .toIfAlone([
        { set_variable: { name: "spacefn_mode", value: 0 } },
        { halt: true, key_code: "spacebar" },
      ])
      .toIfHeldDown([{ set_variable: { name: "spacefn_mode", value: 1 } }])
      // .toDelayedAction({ key_code: "spacebar" }, [
      //   { set_variable: { name: "spacefn_mode", value: 0 } },
      // ]),
      .toAfterKeyUp([
        {
          set_variable: {
            name: "spacefn_mode",
            value: 0,
          },
        },
      ]),
  ]),
  rule("SpaceFnモードでjkilを←↓↑→にする").manipulators([
    map({ key_code: "j", modifiers: { optional: ["any"] } })
      .condition({ name: "spacefn_mode", type: "variable_if", value: 1 })
      .to({ key_code: "left_arrow" }),
    map({ key_code: "k", modifiers: { optional: ["any"] } })
      .condition({ name: "spacefn_mode", type: "variable_if", value: 1 })
      .to({ key_code: "down_arrow" }),
    map({ key_code: "i", modifiers: { optional: ["any"] } })
      .condition({ name: "spacefn_mode", type: "variable_if", value: 1 })
      .to({ key_code: "up_arrow" }),
    map({ key_code: "l", modifiers: { optional: ["any"] } })
      .condition({ name: "spacefn_mode", type: "variable_if", value: 1 })
      .to({ key_code: "right_arrow" }),
  ]),
  rule("SpaceFnモードでw,bをOption+→,←にする").manipulators([
    map({ key_code: "w", modifiers: { optional: ["any"] } })
      .condition({ name: "spacefn_mode", type: "variable_if", value: 1 })
      .to({ key_code: "right_arrow", modifiers: ["left_option"] }),
    map({ key_code: "b", modifiers: { optional: ["any"] } })
      .condition({ name: "spacefn_mode", type: "variable_if", value: 1 })
      .to({ key_code: "left_arrow", modifiers: ["left_option"] }),
  ]),
  rule("SpaceFnモードでa,eをHome,Endにする").manipulators([
    map({ key_code: "a", modifiers: { optional: ["any"] } })
      .condition({ name: "spacefn_mode", type: "variable_if", value: 1 })
      .to({ key_code: "left_arrow", modifiers: ["left_command"] }),
    map({ key_code: "e", modifiers: { optional: ["any"] } })
      .condition({ name: "spacefn_mode", type: "variable_if", value: 1 })
      .to({ key_code: "right_arrow", modifiers: ["left_command"] }),
  ]),
  rule("SpaceFnモードでu,oをPageUp, PageDownにする").manipulators([
    map({ key_code: "u", modifiers: { optional: ["any"] } })
      .condition({ name: "spacefn_mode", type: "variable_if", value: 1 })
      .to({ key_code: "page_up" }),
    map({ key_code: "o", modifiers: { optional: ["any"] } })
      .condition({ name: "spacefn_mode", type: "variable_if", value: 1 })
      .to({ key_code: "page_down" }),
  ]),
  // rule("SpaceFnモードでmをEnterにする").manipulators([
  //   map({ key_code: "m", modifiers: { optional: ["any"] } })
  //     .condition({ name: "spacefn_mode", type: "variable_if", value: 1 })
  //     .to({ key_code: "return_or_enter" }),
  // ]),
  // rule("SpaceFnモードでn,mを英数,かなにする").manipulators([
  //   map({ key_code: "n", modifiers: { optional: ["any"] } })
  //     .condition({ name: "spacefn_mode", type: "variable_if", value: 1 })
  //     .to({ key_code: "japanese_eisuu" }),
  //   map({ key_code: "m", modifiers: { optional: ["any"] } })
  //     .condition({ name: "spacefn_mode", type: "variable_if", value: 1 })
  //     .to({ key_code: "japanese_kana" }),
  // ]),
  rule("SpaceFnモードでcomma, dotを戻る,進むにする").manipulators([
    map({ key_code: "comma", modifiers: { optional: ["any"] } })
      .condition({ name: "spacefn_mode", type: "variable_if", value: 1 })
      .to({ key_code: "open_bracket", modifiers: ["left_command"] }),
    // .toPointingButton("button4"),
    map({ key_code: "period", modifiers: { optional: ["any"] } })
      .condition({ name: "spacefn_mode", type: "variable_if", value: 1 })
      .to({ key_code: "close_bracket", modifiers: ["left_command"] }),
    // .toPointingButton("button5"),
  ]),
  rule("SpaceFnモードでx,c,vをDelete, Copy, Pasteにする").manipulators([
    map({ key_code: "x", modifiers: { optional: ["any"] } })
      .condition({ name: "spacefn_mode", type: "variable_if", value: 1 })
      .to({ key_code: "x", modifiers: ["left_command"] }),
    map({ key_code: "c", modifiers: { optional: ["any"] } })
      .condition({ name: "spacefn_mode", type: "variable_if", value: 1 })
      .to({ key_code: "c", modifiers: ["left_command"] }),
    map({ key_code: "v", modifiers: { optional: ["any"] } })
      .condition({ name: "spacefn_mode", type: "variable_if", value: 1 })
      .to({ key_code: "v", modifiers: ["left_command"] }),
  ]),
  rule("SpaceFnモードでz, yをUndo, Redoにする").manipulators([
    map({ key_code: "z", modifiers: { optional: ["any"] } })
      .condition({ name: "spacefn_mode", type: "variable_if", value: 1 })
      .to({ key_code: "z", modifiers: ["left_command"] }),
    map({ key_code: "y", modifiers: { optional: ["any"] } })
      .condition({ name: "spacefn_mode", type: "variable_if", value: 1 })
      .to({ key_code: "z", modifiers: ["left_command", "left_shift"] }),
  ]),
  rule("SpaceFnモードでhをbackspaceに、dをdeleteにする").manipulators([
    map({ key_code: "h", modifiers: { optional: ["any"] } })
      .condition({ name: "spacefn_mode", type: "variable_if", value: 1 })
      .to({ key_code: "delete_or_backspace" }),
    map({ key_code: "d", modifiers: { optional: ["any"] } })
      .condition({ name: "spacefn_mode", type: "variable_if", value: 1 })
      .to({ key_code: "delete_forward" }),
  ]),
  rule(
    "SpaceFnモードでBackspaceとDeleteをそれぞれOption+Backspace, Option+Deleteにする"
  ).manipulators([
    map({ key_code: "delete_or_backspace", modifiers: { optional: ["any"] } })
      .condition({ name: "spacefn_mode", type: "variable_if", value: 1 })
      .to({ key_code: "delete_or_backspace", modifiers: ["right_option"] }),
    map({ key_code: "delete_forward", modifiers: { optional: ["any"] } })
      .condition({ name: "spacefn_mode", type: "variable_if", value: 1 })
      .to({ key_code: "delete_forward", modifiers: ["right_option"] }),
  ]),
  // rule("SpaceFnモードでsをCommand+sにする").manipulators([
  //   map({ key_code: "s", modifiers: { optional: ["any"] } })
  //     .condition({ name: "spacefn_mode", type: "variable_if", value: 1 })
  //     .to({ key_code: "s", modifiers: ["left_command"] }),
  // ]),
  rule("SpaceFnモードでsをspacebarにする").manipulators([
    map({ key_code: "s", modifiers: { optional: ["any"] } })
      .condition({ name: "spacefn_mode", type: "variable_if", value: 1 })
      .to({ key_code: "spacebar" }),
  ]),
  rule("SpaceFnモードで=から-をmF1からF12にする").manipulators([
    withMapper([
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
      "7",
      "8",
      "9",
      "0",
      "hyphen",
      "equal_sign",
    ])((key, i) =>
      map({ key_code: key, modifiers: { optional: ["any"] } })
        .condition({ name: "spacefn_mode", type: "variable_if", value: 1 })
        .to({ key_code: ("f" + ++i) as FunctionKeyCode })
    ),
  ]),
]);
