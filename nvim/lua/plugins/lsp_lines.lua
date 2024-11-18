vim.diagnostic.config({
    virtual_text = false,
    virtual_lines = true,
})

vim.keymap.set("n", "<leader>d", function()
    require("lsp_lines").toggle()
end)

return {
    {
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        opts = {},
    },
}
