return {
    "jpalardy/vim-slime",
    init = function()
        vim.g.slime_target = "neovim"
        vim.g.slime_suggest_default = true

        vim.keymap.set("n", "<leader>n", function()
            vim.cmd("vs")
            vim.cmd("terminal")
            vim.cmd("setlocal nonumber norelativenumber")
            vim.cmd([[vertical res 80]])
        end)

        vim.keymap.set("t", "<esc><esc>", "<C-\\><C-n>")
    end,
}
