return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    config = function()
        local builtin = require("telescope.builtin")

        vim.keymap.set("n", "<leader>fa", builtin.find_files, {
            desc = "Look for files in the directory nvim started",
        })

        vim.keymap.set("n", "<leader>fg", builtin.live_grep, {
            desc = "Grep on files in the directory nvim started",
        })
    end,
}
