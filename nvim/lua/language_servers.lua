local lspconfig = require("lspconfig")

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Lua
lspconfig.lua_ls.setup({
    capabilities = capabilities,
    on_init = function(client)
        if client.workspace_folders == nil then
            return
        end
        local path = client.workspace_folders[1].name
        if
            vim.loop.fs_stat(path .. "/.luarc.json")
            or vim.loop.fs_stat(path .. "/.luarc.jsonc")
        then
            return
        end

        client.config.settings.Lua =
            vim.tbl_deep_extend("force", client.config.settings.Lua, {
                runtime = {
                    version = "LuaJIT",
                },
                workspace = {
                    checkThirdParty = false,
                    library = {
                        vim.env.VIMRUNTIME,
                        -- "${3rd}/love2d/library",
                        -- other libs
                    },
                },
            })
    end,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
})

-- Nix
lspconfig.nixd.setup({
    capabilities = capabilities,
})
