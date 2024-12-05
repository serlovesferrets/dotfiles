local gitsigns = {
    "lewis6991/gitsigns.nvim",
    config = function()
        local gs = require("gitsigns")

        vim.keymap.set("n", "<leader>gs", function()
            print("Staged hunk!")
            gs.stage_hunk()
        end)

        vim.keymap.set("n", "<leader>gb", function()
            print("Staged buffer!")
            gs.stage_buffer()
        end)

        vim.keymap.set("n", "<leader>gr", function()
            print("Removed hunk!")
            gs.reset_hunk()
        end)

        vim.keymap.set("n", "<leader>gx", function()
            print("Removed buffer!")
            gs.reset_buffer()
        end)

        gs.setup({
            current_line_blame = false
        })
    end,
}

local diffview = {
    "sindrets/diffview.nvim",
    config = function()
        local dv = require("diffview")
        vim.keymap.set("n", "<leader>gd", ":DiffviewOpen<CR>")
        vim.keymap.set("n", "<leader>go", ":DiffviewOpen ")
        vim.keymap.set("n", "<leader>gc", ":DiffviewClose<CR>")
        vim.keymap.set("n", "<leader>gf", ":DiffviewToggleFiles<CR>")
    end,
}

return {
    gitsigns,
    diffview,
}
