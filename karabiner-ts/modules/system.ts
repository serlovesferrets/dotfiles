import { hyperLayer, toKey } from "karabiner.ts";

export function systemControl() {
    return hyperLayer("c", "control-system").manipulators({
        j: toKey("volume_down"), // n
        k: toKey("volume_up"), // e
        m: toKey("mute"), // m
        u: toKey("display_brightness_decrement"), // l
        i: toKey("display_brightness_increment"), // u
        '⏎': toKey("play_or_pause"), // p
        e: toKey("f", "fn") // f
    });
}
