---@diagnostic disable: unused-local
local ls = require("luasnip")

local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.conditions")
local conds_expand = require("luasnip.extras.conditions.expand")

local python = {
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

local lua = {
    s("lsp", {
        t("lspconfig."),
        i(1, "lsp_name"),
        t(".setup({"),
        t({ "", "    capabilities = capabilities" }),
        t({ "", "})" }),
    }),
}

local js = {
    s("doc", {
        t("/**"),
        t({ "", " * " }),
        i(1),
        t({ "", " */" }),
    }),
}

local nix = {
    s("unstable", {
        t("github:NixOS/nixpkgs/nixos-unstable"),
    }),
}

ls.add_snippets("python", python)
ls.add_snippets("lua", lua)
ls.add_snippets("javascript", js)
ls.add_snippets("nix", nix)
