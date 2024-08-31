local lspconfig = require("lspconfig")

-- Lua
lspconfig.lua_ls.setup({
    on_init = function(client)
        if client.workspace_folders == nil then
            return
        end
        local path = client.workspace_folders[1]
        if path == nil then
            return
        end
        local path_name = path.name
        if
            ---@diagnostic disable-next-line: undefined-field (fs_stat)
            vim.loop.fs_stat(path_name .. "/.luarc.json")
            ---@diagnostic disable-next-line: undefined-field
            or vim.loop.fs_stat(path_name .. "/.luarc.jsonc")
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
                    },
                },
            })
    end,
})

-- Nix
lspconfig.nixd.setup({})
