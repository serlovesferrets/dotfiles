local ls = require("luasnip")
local s, t, i = ls.snippet, ls.text_node, ls.insert_node

return {
    s("date", {
        t(os.date("%Y.%m.%d")),
    }),
    s("time", {
        t(os.date("%H:%M")),
    }),
}
