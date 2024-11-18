return {
    "lewis6991/gitsigns.nvim",
    keys = {
        {
            "<leader>gsa",
            function()
                vim.cmd([[Gitsigns attach]])
                vim.cmd([[Gitsigns toggle_signs true]])
                vim.cmd([[Gitsigns toggle_current_line_blame true]])
            end,
            desc = "Attach gitsigns",
        },
        {
            "<leader>gsd",
            function()
                vim.cmd([[Gitsigns toggle_signs false]])
                vim.cmd([[Gitsigns toggle_current_line_blame false]])
                vim.cmd([[Gitsigns detach]])
            end,
            desc = "Disable gitsigns",
        },
    },
    opts = {
        current_line_blame = true,
        auto_attach = false,
    },
}
