vim.api.nvim_create_autocmd("BufEnter", {
    desc = "Disables the automatic continuation of comments on newlines",
    callback = function()
        vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
    end,
})

local indent_size_spaces_fts = {
    "*.hs",
    "*.ml",
    "*.mli",
    "*.jsx",
    "*.tsx",
    "*.config.js",
    "*.config.ts",
}

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = indent_size_spaces_fts,
    callback = function()
        vim.bo.tabstop = 2
        vim.bo.softtabstop = 2
        vim.bo.shiftwidth = 2
    end,
})
