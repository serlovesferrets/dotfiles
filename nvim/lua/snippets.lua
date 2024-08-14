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
local extras = require("luasnip.extras")

local general = {
    s("date", {
        t(os.date("%Y.%m.%d")),
    }),
    s("time", {
        t(os.date("%H:%M")),
    }),
}

ls.add_snippets("markdown", general)
ls.add_snippets("oil", general)

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

ls.add_snippets("python", python)

local nvim = {
    s("add_lsp", {
        t("lspconfig."),
        i(1, "lsp_name"),
        t(".setup({"),
        t({ "", "    capabilities = capabilities" }),
        t({ "", "})" }),
    }),
    s("add_formatter", {
        t("conform.formatters_by_ft."),
        i(1, "language"),
        t(' = { "'),
        i(2, "formatter"),
        t('" }'),
    }),
    s("add_ft", {
        t("vim.filetype.add({"),
        t({ "", "   " }),
        i(1),
        t({ "", "})" }),
    }),
}

ls.add_snippets("lua", nvim)

local js = {
    s("doc", {
        t("/**"),
        t({ "", " * " }),
        i(1),
        t({ "", " */" }),
    }),
}

ls.add_snippets("javascript", js)

local nix = {
    s("unstable", {
        t("github:NixOS/nixpkgs/nixos-unstable"),
    }),
}

ls.add_snippets("nix", nix)

local markdown = {
    s("i", {
        t("*"),
        i(1),
        t("*"),
    }),
    s("b", {
        t("**"),
        i(1),
        t("**"),
    }),
}

ls.add_snippets("markdown", markdown)

local cs = {
    s("r", { t("return ") }),

    s("cw", {
        t("Console.WriteLine("),
        i(1),
        t(");"),
    }),

    s("ns", {
        t("namespace "),
        i(1, "namespace"),
        t(";"),
        t({ "", "" }),
        t({ "", "" }),
        i(2),
    }),

    s("u", {
        t("using "),
        i(1, "Namespace"),
    }),

    s("exts", {
        t("public static class "),
        i(1, "Type"),
        t("Extensions"),
        t({ "", "{" }),
        t({ "", "    " }),
        i(2),
        t({ "", "}" }),
    }),

    s("ext", {
        t("public static "),
        i(1, "void"),
        t(" "),
        i(2, "MethodName"),
        t("(this "),
        i(3, "TypeToExtend"),
        t(" "),
        i(4, "paramName"),
        t(")"),
    }),

    s("pc", {
        t("public class "),
        i(1, "ClassName"),
    }),

    s("ps", {
        t("public struct "),
        i(1, "StructName"),
    }),

    s("pi", {
        t("public interface I"),
        i(1, "Interface"),
    }),

    s("pac", {
        t("public abstract class "),
        i(1, "ClassName"),
    }),

    s("psc", {
        t("public static class "),
        i(1, "ClassName"),
    }),

    s("pr", {
        t("public record "),
        i(1, "RecordName"),
    }),

    s("par", {
        t("public abstract record "),
        i(1, "RecordName"),
    }),

    s("prs", {
        t("public record struct "),
        i(1, "RecordName"),
    }),

    s("prrs", {
        t("public readonly record struct "),
        i(1, "RecordName"),
    }),

    s("state machine", {
        t("[StateMachine]"),
        t({ "", "public class " }),
        i(1, "MachineName"),
        t(" : LogicBlock<"),
        extras.rep(1),
        t(".State>"),
        t({ "", "{" }),
        t({ "", "    public static class Input { }" }),
        t({ "", "" }),
        t({ "", "    public abstract record State : StateLogic { }" }),
        t({ "", "" }),
        t({ "", "    public static class Output { }" }),
        t({ "", "}" }),
    }),

    s("iget", {
        t("IGet<Input."),
        i(1, "Input"),
        t(">"),
    }),

    s("state", {
        t("public record "),
        i(1, "StateName"),
        t(" : State"),
        t({ "", "{" }),
        t({ "", "    " }),
        i(2),
        t({ "", "}" }),
    }),

    s("initstate", {
        t("public override State GetInitialState() => new "),
        i(1, "StateName"),
        t("();"),
    }),

    s("gp", {
        t("GD.Print("),
        i(1),
        t(");"),
    }),

    s("gn", {
        t("GetNode<"),
        i(1, "NodeType"),
        t('>("'),
        i(2, "NodeName"),
        t('")'),
    }),
}

ls.add_snippets("cs", cs)

local fs = {
    s("f", {
        t("fun "),
        i(1, "params"),
        t(" -> "),
        i(2, "body"),
    }),

    s("fn", {
        t({ "", "    function" }),
        t({ "", "    | " }),
        i(1, "case"),
        t(" -> "),
        i(2, "body"),
    }),
}

ls.add_snippets("fsharp", fs)
