return {
    "stevearc/conform.nvim",
    opts = {
        quiet = true,
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "black" },
            nix = {"nixpkgs_fmt"}
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
