local ls = require("luasnip")
local s, t, i = ls.snippet, ls.text_node, ls.insert_node
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt

return {
    s("req", fmt('require("{}")', { i(1, "name") })),
    s("rel", fmt('local {} = require("{}")', {
            i(1, "module"),
            rep(1),
        })
    ),
    s("add_lsp", fmt("lspconfig.{}.setup()", { i(1, "lsp_name") })),
    s("add_formatter", fmt('conform.formatters_by_ft.{} = {{ "{}" }}', {
            i(1, "language"),
            i(2, "formatter"),
        })
    ),
    s("add_ft", fmt([[
    vim.filetype.add({{
        {}
    }})
    ]],{ i(1, "contents") })),
}
