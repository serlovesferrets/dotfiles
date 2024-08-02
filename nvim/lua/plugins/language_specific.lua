return {
    -- Neovim
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                { path = "luvit-meta/library", words = { "vim%.uv" } },
            },
        },
        dependencies = { "Bilal2453/luvit-meta", lazy = true },
    },
    -- F#
    {
        "adelarsq/neofsharp.vim",
        ft = "fsharp",
    },
    -- LaTeX
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
        "iurimateus/luasnip-latex-snippets.nvim",
        dependencies = { "L3MON4D3/LuaSnip", "lervag/vimtex" },
        ft = "tex",
        config = function()
            require("luasnip-latex-snippets").setup({ use_treesitter = false })
        end,
    },
}
