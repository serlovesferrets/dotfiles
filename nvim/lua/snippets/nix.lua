local ls = require("luasnip")
local s, t, i = ls.snippet, ls.text_node, ls.insert_node

return {
    s("unstable", {
        t("github:NixOS/nixpkgs/nixos-unstable"),
    }),
}

