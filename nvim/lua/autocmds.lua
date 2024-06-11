vim.api.nvim_create_autocmd("BufEnter", {
    desc = "Disables the automatic continuation of comments on newlines",
    callback = function()
        vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
    end,
})

local indent_size_spaces_fts = {
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

local info_ft_group =
    vim.api.nvim_create_augroup("no_cc_group", { clear = true })

local info_fts = {
    "*.md*",
    "*.txt",
    "*.tex",
}

vim.api.nvim_create_autocmd("BufEnter", {
    group = info_ft_group,
    pattern = info_fts,
    callback = function()
        vim.wo.colorcolumn = "0"
        vim.wo.wrap = true
        vim.wo.linebreak = true
    end,
})

vim.api.nvim_create_autocmd("BufLeave", {
    group = info_ft_group,
    pattern = info_fts,
    callback = function()
        vim.wo.colorcolumn = "80"
        vim.wo.wrap = false
        vim.wo.linebreak = false
    end,
})
