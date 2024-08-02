return {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        vim.keymap.set("n", "<leader>tt", function()
            vim.cmd([[NvimTreeFindFileToggle]])
        end, {
            desc = "Open the file tree",
        })

        require("nvim-tree").setup({
            filters = { custom = { "^.git$" } },
            view = { width = 60, number = true, relativenumber = true },
            renderer = {
                indent_markers = {
                    enable = true,
                },
                icons = {
                    show = {
                        file = true,
                        folder = false,
                        folder_arrow = false,
                        git = false,
                    },
                },
            },
        })
    end,
}
