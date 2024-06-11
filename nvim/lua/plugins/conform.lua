return {
    "stevearc/conform.nvim",
    opts = {
        quiet = true,
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "black" },
            javascript = { "prettierd", "prettier" },
            typescript = { "prettierd", "prettier" },
            tex = { "latexindent" },
            haskell = { "fourmolu" }
        },
    },
    keys = {
        {
            "<C-f>",
            function()
                require("conform").format({
                    async = true,
                    lsp_fallback = true,
                })
            end,
            desc = "Format buffer",
        },
    },
}
