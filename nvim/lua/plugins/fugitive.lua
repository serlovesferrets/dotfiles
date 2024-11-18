return {
    lazy = false,
    "tpope/vim-fugitive",
    config = function ()
        -- Just want to put text into the cmdline
        vim.cmd([[nnoremap g<leader>g :vertical Git ]])
    end,
    keys = {
        {
            "<leader>gg",
            function()
                vim.cmd([[vertical Git]])
            end,
        },
    },
}
