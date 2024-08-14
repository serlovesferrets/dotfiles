local ls = require("luasnip")
local s, t, i = ls.snippet, ls.text_node, ls.insert_node

return {
    s("dclass", {
        t("@dataclass"),
        t({ "", "class " }),
        i(1, "ClassName"),
        t(":"),
        t({ "", "    " }),
        i(2, "pass"),
    }),
    s("lc", {
        t("["),
        i(3, "None"),
        t(" for "),
        i(2, "elt"),
        t(" in "),
        i(1, "elts"),
        t(" if "),
        i(4, "True"),
        t("]"),
    }),
}
