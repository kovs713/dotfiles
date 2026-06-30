#include QMK_KEYBOARD_H
#include "vial.h"

enum custom_keycodes {
    SYM = SAFE_RANGE,
    NAV,
};

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

    /*
     * layer 0 · base
     */
    [0] = LAYOUT(
        KC_NO,    KC_NO,        KC_NO,        KC_NO,        KC_NO,        KC_NO,                                  KC_NO,       KC_NO,        KC_NO,        KC_NO,        KC_NO,           KC_NO,

        KC_TAB,   KC_Q,         KC_W,         KC_E,         KC_R,         KC_T,                                   KC_Y,        KC_U,         KC_I,         KC_O,         KC_P,            KC_LBRC,
        KC_ESC,   LGUI_T(KC_A), LALT_T(KC_S), LSFT_T(KC_D), LCTL_T(KC_F), KC_G,                                   KC_H,        RCTL_T(KC_J), RSFT_T(KC_K), RALT_T(KC_L), RGUI_T(KC_SCLN), KC_QUOT,
        KC_GRV,   KC_Z,         KC_X,         KC_C,         KC_V,         KC_B,                                   KC_N,        KC_M,         KC_COMM,      KC_DOT,       KC_SLSH,         KC_BSLS,

                                                        NAV,       SYM,       KC_SPC,          KC_ENT,    KC_BSPC,     KC_DEL
    ),

    /*
     * layer 1 · sym
     *
     * ! @ # $ %     ^ & * ( ) ]
     * 1 2 3 4 5     6 7 8 9 0 \
     * ~ _ + - =       { } < >
     */
    [1] = LAYOUT(
        KC_NO,     KC_NO,       KC_NO,       KC_NO,       KC_NO,       KC_NO,                                  KC_NO,       KC_NO,       KC_NO,       KC_NO,        KC_NO,          KC_NO,

        KC_TAB,    S(KC_1),     S(KC_2),     S(KC_3),     S(KC_4),     S(KC_5),                                S(KC_6),     S(KC_7),     S(KC_8),     S(KC_9),      S(KC_0),        KC_RBRC,
        KC_ESC,    KC_1,        KC_2,        KC_3,        KC_4,        KC_5,                                   KC_6,        KC_7,        KC_8,        KC_9,         KC_0,           KC_BSLS,
        S(KC_GRV), S(KC_MINS),  S(KC_EQL),   KC_MINS,     KC_EQL,      KC_NO,                                  KC_NO,       S(KC_LBRC),  S(KC_RBRC),  S(KC_COMM),   S(KC_DOT),      KC_NO,

                                                            NAV,       SYM,       KC_SPC,          KC_ENT,    KC_BSPC,     KC_DEL
    ),

    /*
     * layer 2 · nav/media
     *
     * f1  f2  f3  f4  f5  f6      f7  f8  f9  f10 f11 f12
     * br+ prt mb3 mb2 mb1 wu      ←   ↓   ↑   →   v+  pgu
     * br- mut ⏮   ⏯   ⏭   wd      m←  m↓  m↑  m→  v-  pgd
     */
    [2] = LAYOUT(
        KC_NO,    KC_NO,       KC_NO,       KC_NO,       KC_NO,       KC_NO,                                  KC_NO,       KC_NO,       KC_NO,       KC_NO,        KC_NO,          KC_NO,

        KC_F1,    KC_F2,       KC_F3,       KC_F4,       KC_F5,       KC_F6,                                  KC_F7,       KC_F8,       KC_F9,       KC_F10,       KC_F11,         KC_F12,
        KC_BRIU,  KC_PSCR,     KC_BTN3,     KC_BTN2,     KC_BTN1,     KC_WH_U,                                KC_LEFT,     KC_DOWN,     KC_UP,       KC_RGHT,      KC_VOLU,        KC_PGUP,
        KC_BRID,  KC_MUTE,     KC_MPRV,     KC_MPLY,     KC_MNXT,     KC_WH_D,                                KC_MS_L,     KC_MS_D,     KC_MS_U,     KC_MS_R,      KC_VOLD,        KC_PGDN,

                                                        NAV,       SYM,       KC_SPC,          KC_ENT,    KC_BSPC,     KC_DEL
    )
};

const char PROGMEM vial_uuid[] = VIAL_KEYBOARD_UID;

uint32_t vial_get_combo(uint16_t index) {
    return 0;
}

static void send_layer_key_event(uint8_t layer, bool pressed) {
    uint8_t data[32] = {0};

    data[0] = 0x4C;              // 'L' = layer key event
    data[1] = layer;             // 1 или 2
    data[2] = pressed ? 1 : 0;   // 1 press, 0 release

    host_raw_hid_send(data, sizeof(data));
}

bool process_record_user(uint16_t keycode, keyrecord_t *record) {
    switch (keycode) {
        case SYM:
            if (record->event.pressed) {
                layer_on(1);
                send_layer_key_event(1, true);
            } else {
                layer_off(1);
                send_layer_key_event(1, false);
            }
            return false;

        case NAV:
            if (record->event.pressed) {
                layer_on(2);
                send_layer_key_event(2, true);
            } else {
                layer_off(2);
                send_layer_key_event(2, false);
            }
            return false;
    }

    return true;
}
