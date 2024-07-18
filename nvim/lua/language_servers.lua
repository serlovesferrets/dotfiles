local lspconfig = require("lspconfig")

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Lua
lspconfig.lua_ls.setup({
    capabilities = capabilities,
    on_init = function(client)
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
                        "${3rd}/love2d/library",
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

-- Python
lspconfig.pyright.setup({
    capabilities = capabilities,
})

-- C / C++
lspconfig.clangd.setup({
    capabilities = capabilities,
})

lspconfig.cmake.setup({
    capabilities = capabilities,
})

lspconfig.mesonlsp.setup({
    capabilities = capabilities,
    root_dir = lspconfig.util.root_pattern(
        "meson_options.txt",
        "meson.options",
        ".git",
        "meson.build"
    ),
})

-- Rust
lspconfig.rust_analyzer.setup({
    capabilities = capabilities,
})

-- Haskell
lspconfig.hls.setup({
    capabilities = capabilities,
    filetypes = { "haskell", "cabal" },
})

-- OCaml
lspconfig.ocamllsp.setup({
    capabilities = capabilities,
})

-- JavaScript / TypeScript
lspconfig.tsserver.setup({
    capabilities = capabilities,
})

lspconfig.eslint.setup({
    capabilities = capabilities,
})

-- Tailwind
lspconfig.tailwindcss.setup({
    capabilities = capabilities,
    filetypes = {
        "django-html",
        "htmldjango",
        "html",
        "css",
        "javascriptreact",
        "typescriptreact",
    },
})

local web_capabilities = vim.lsp.protocol.make_client_capabilities()
web_capabilities.textDocument.completion.completionItem.snippetSupport = true

-- HTML
lspconfig.html.setup({
    capabilities = capabilities,
})

-- CSS
lspconfig.cssls.setup({
    capabilities = web_capabilities,
})

-- JSON
lspconfig.jsonls.setup({
    capabilities = web_capabilities,
})

-- Java
lspconfig.jdtls.setup({
    capabilities = capabilities,
})

-- Lean
lspconfig.leanls.setup({
    capabilities = capabilities,
})

-- C#
lspconfig.csharp_ls.setup({
    capabilities = capabilities,
})

-- Go
lspconfig.gopls.setup({
    capabilities = capabilities,
})

-- LaTeX
lspconfig.texlab.setup({
    capabilities = capabilities,
})

-- PHP
lspconfig.phpactor.setup({
    capabilities = capabilities,
})
