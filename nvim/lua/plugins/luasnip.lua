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
        luasnip.config.setup { enable_autosnippets = true }

        vim.keymap.set("i", "<c-j>", function()
            luasnip.jump(1)
        end, opts("Jump to the next insert node."))

        vim.keymap.set("i", "<c-k>", function()
            luasnip.jump(-1)
        end, opts("Jump to the previous insert node."))
    end,
}
