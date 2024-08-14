return {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    config = function()
        local opts = function(desc)
            return {
                silent = true,
                desc = desc,
            }
        end

        local luasnip = require("luasnip")
        luasnip.config.setup({ enable_autosnippets = true })

        vim.keymap.set("i", "<c-j>", function()
            luasnip.jump(1)
        end, opts("Jump to the next insert node."))

        vim.keymap.set("i", "<c-k>", function()
            luasnip.jump(-1)
        end, opts("Jump to the previous insert node."))

        local config_path = vim.api.nvim_list_runtime_paths()[1]

        require("luasnip.loaders.from_lua").load({
            lazy_paths = { config_path .. "/lua/snippets/" },
        })
    end,
}
