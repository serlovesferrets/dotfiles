local y_hl = "Conditional"
local n_hl = "WinSeparator"

return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
        scope = { enabled = true, highlight = y_hl },
        indent = { highlight = n_hl },
    },
}
