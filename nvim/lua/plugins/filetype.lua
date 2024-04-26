---Sets the tab width for a certain filetype
---@param filetype string
---@param num number
local set_tab_width = function(filetype, num)
    vim.bo.filetype = filetype

    vim.bo.tabstop = num
    vim.bo.softtabstop = num
    vim.bo.shiftwidth = num
end

return {
    "nathom/filetype.nvim",
    lazy = false,
    opts = {
        overrides = {
            function_extensions = {
                ["hs"] = function()
                    set_tab_width("haskell", 2)
                end,
            },
        },
    },
}
