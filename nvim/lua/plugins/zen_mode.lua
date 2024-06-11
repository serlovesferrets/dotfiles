return {
    "folke/zen-mode.nvim",
    opts = {
        window = {
            width = 90,
        },
    },
    keys = {
        {
            "<Leader>z",
            function()
                vim.cmd [[ZenMode]]
            end,
            desc = "Toggle zen mode",
        },
    },
}
