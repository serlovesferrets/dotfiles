import { map, rule, writeToProfile } from "karabiner.ts";

import { openApps, openMessengers } from "./modules/openApps";
import { systemControl } from "./modules/system";

writeToProfile("SerKeeb", [
    rule("Caps Lock → Hyper").manipulators([
        map("caps_lock").toHyper().toIfAlone("escape"),
    ]),
    openApps(),
    openMessengers(),
    systemControl(),
]);
