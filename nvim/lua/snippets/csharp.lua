local ls = require("luasnip")
local s, t, i = ls.snippet, ls.text_node, ls.insert_node
local rep = require("luasnip.extras").rep

return {
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
        rep(1),
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
