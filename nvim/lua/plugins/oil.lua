return {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        vim.keymap.set(
            "n",
            "-",
            "<CMD>Oil<CR>",
            { desc = "Open parent directory" }
        )
        require("oil").setup({
            default_file_explorer = true,
            columns = {
                "icon",
                "mtime",
            },
            delete_to_trash = true,
            watch_for_changes = true,
            view_options = {
                show_hidden = false,
                is_hidden_file = function(name, _)
                    return vim.startswith(name, ".") or name == "result"
                end,
            },
        })
    end,
}
