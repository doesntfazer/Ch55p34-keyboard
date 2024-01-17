let { tap, hold, td, combo, .. } = import "../ncl/fak/keycode.ncl" in
let util = import "../ncl/fak/util_functions.ncl" in
let kc = tap.reg.kc in
let mo = hold.reg.layer in
let md = hold.reg.mod in
let ks = tap.reg.ks in
let TRNS = tap.trans in

let ki = {
  hp = { decision = 'hold, trigger_on = 'press },
  tp = { decision = 'tap, trigger_on = 'press },
  hr = { decision = 'hold, trigger_on = 'release },
  tr = { decision = 'tap, trigger_on = 'release },
  xx = { decision = 'none },
} in

let zsftbehavior = {
  timeout_ms = 200,
  key_interrupts = [
    ki.hp,   ki.hp, ki.hp,  ki.hp,  ki.hp,     ki.hp, ki.hp, ki.hp, ki.hp, ki.hp,
    ki.hp, ki.hp, ki.hp,  ki.hp,  ki.hp,     ki.hp, ki.hp, ki.hp, ki.hp, ki.hp,
    ki.hp, ki.hp, ki.hp,  ki.hp,  ki.hp,     ki.hp, ki.hp, ki.hp, ki.hp, ki.hp,
                      ki.hp,  ki.hp,     ki.hp, ki.hp,
  ],
} in

let shift = fun k => tap.reg.mod.lsft & k in
let ctla = tap.reg.kc.A & tap.reg.mod.lctl in
let zsft = tap.reg.kc.Z & hold.reg.mod.lsft & hold.reg.behavior zsftbehavior in
let actl = tap.reg.kc.A & hold.reg.mod.lctl & hold.reg.behavior { } in
let slsft = tap.reg.kc.SLASH & hold.reg.mod.lsft & hold.reg.behavior zsftbehavior in
let cad = tap.reg.mod.lctl & tap.reg.mod.lalt & kc.DEL in
{
  conditional_layers = {
    "3" = [1, 2],
  },
  layers = [
    [ # Layer 0
    kc.Q, kc.W, kc.F, kc.P, kc.G,            kc.J, kc.L, kc.U,   kc.Y, kc.QUOTE,
    actl, kc.R, kc.S, kc.T, kc.D,            kc.H, kc.N, kc.E,   kc.I, kc.O,
    zsft, kc.X, kc.C, kc.V, kc.B,            kc.K, kc.M, kc.COMMA, kc.DOT, slsft,
                      mo 1, kc.SPACE,     kc.BACKSPACE, mo 2,
    ],
      [ # Layer 1
    kc.N1,  kc.N2,   kc.N3,   kc.N4,   kc.N5,            kc.N6,    kc.N7,   kc.N8,    kc.N9,     kc.N0,
    kc.TAB, kc.LEFT, kc.DOWN, kc.UP,   kc.RIGHT,         TRNS,     kc.MINS, kc.EQL,   kc.LBRC,   kc.RBRC,
    md.lctl, kc.GRV, md.lgui, md.lalt, TRNS,             TRNS,     TRNS,    TRNS,     kc.BACKSLASH, kc.SEMICOLON,
                              mo 1,    kc.SPACE,         kc.ENTER, mo 2,
    ],
      [ # Layer 2
    ks.EXLM,  shift kc.N2,   shift kc.N3,   shift kc.N4,   shift kc.N5,            shift kc.N6,    shift kc.N7,   shift kc.N8,    shift kc.N9,     shift kc.N0,
    kc.ESC, kc.DEL, ctla, TRNS,  TRNS,         TRNS,    shift kc.MINS, shift kc.EQL,  shift kc.LBRC,  shift kc.RBRC,
    kc.CAPS, shift kc.GRV, kc.PGDN, kc.PGUP, TRNS,             TRNS,     TRNS,    TRNS,    shift kc.BACKSLASH, shift kc.SEMICOLON,
                              mo 1,    kc.SPACE,         kc.ENTER, mo 2,
    ],
      [ # Layer 3
    kc.F1, kc. F2, kc.F3, kc.F4, kc.F5,            kc.F6, kc.F7, kc.F8,   kc.F9, kc.F10,
    kc.F11, kc.F12, TRNS, TRNS, TRNS,            TRNS, TRNS, cad,   TRNS, TRNS,
    TRNS, TRNS, TRNS, TRNS, TRNS,            TRNS, TRNS, TRNS, TRNS, TRNS,
                      mo 1, tap.custom.fak.BOOT,     kc.BACKSPACE, mo 2,
    ],
  ]
}