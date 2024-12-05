return {
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            ---@diagnostic disable-next-line: missing-fields
            require("nvim-treesitter.configs").setup({
                indent = { enable = true },
                highlight = { enable = true },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        node_incremental = "v",
                        node_decremental = "V",
                    },
                },
            })
        end,
    },
    { "nvim-treesitter/nvim-treesitter-context" },
}
