function TweakColorscheme()
    -- Diff
    vim.api.nvim_set_hl(0, "DiffAdd", {
        bg = "#1f2621",
    })

    vim.api.nvim_set_hl(0, "DiffDelete", {
        fg = "#686873",
        bg = "#1c1618",
    })

    vim.api.nvim_set_hl(0, "DiffText", {
        bg = "#26251f",
    })

    -- Make comments stand out
    vim.api.nvim_set_hl(0, "Comment", {
        fg = "#b8afcf",
        bg = "#221d30",
        italic = true,
    })
end

return {
    "mellow-theme/mellow.nvim",
    priority = 1000,
}
