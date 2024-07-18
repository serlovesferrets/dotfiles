return {
    {
        "lervag/vimtex",
        lazy = false,
        init = function()
            vim.g.vimtex_view_method = "skim"
            vim.g.vimtex_compiler_latexmk_engines = {
                ["_"] = "-lualatex",
            }
        end,
    },
    {
        "iurimateus/luasnip-latex-snippets.nvim", -- vimtex isn't required if using treesitter branch = "fix/lazy-loading", -- change the branch
        dependencies = { "L3MON4D3/LuaSnip", "lervag/vimtex" },
        ft = { "tex" },
        config = function()
            require("luasnip-latex-snippets").setup({ use_treesitter = false }) -- or setup({ use_treesitter = true })
        end,
    },
}
