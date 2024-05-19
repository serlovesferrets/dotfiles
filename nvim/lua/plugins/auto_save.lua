return {
    "Pocco81/auto-save.nvim",
    enabled = false,
    opts = {
        trigger_events = { "InsertLeave", "InsertEnter" },
        execution_message = {
            message = function()
                return ""
            end,
        },
        condition = function(buf)
            local fn = vim.fn
            local utils = require("auto-save.utils.data")

            if vim.bo.filetype == "oil" or vim.bo.filetype == "harpoon" then
                return false
            end

            local modifiable = fn.getbufvar(buf, "&modifiable") == 1
            local no_utils = utils.not_in(fn.getbufvar(buf, "&filetype"), {})
            return modifiable and no_utils
        end,
    },
}
