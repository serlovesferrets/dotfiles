import { hyperLayer, toApp } from "karabiner.ts";

const terminal = "WezTerm";

export function openApps() {
    return hyperLayer("a", "open-app") // a, stands for App
        .manipulators({
            e: toApp("Finder"), // f
            b: toApp("Safari"), // b
            f: toApp(terminal), // t
            j: toApp("Notes"), // n
            c: toApp("Calendar"), // c
            m: toApp("Mail"), // m
            s: toApp("Reminders"), // r
            t: toApp("Godot_mono"), // g
        });
}

export function openMessengers() {
    return hyperLayer("m", "open-messenger")
    .manipulators({
        g: toApp("Discord"), // d
        f: toApp("Telegram"), // t
        w: toApp("WhatsApp"), // w
    })
}
