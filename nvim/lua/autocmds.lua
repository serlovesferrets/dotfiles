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

-- Thanks u/echasnovski on reddit
local root_names = { ".git" }
local root_cache = {}

local set_root = function()
    -- Get directory path to start search from
    local path = vim.api.nvim_buf_get_name(0)
    if path == "" then
        return
    end
    path = vim.fs.dirname(path)

    local root = root_cache[path]
    if root == nil then
        local root_file =
            vim.fs.find(root_names, { path = path, upward = true })[1]
        if root_file == nil then
            return
        end
        root = vim.fs.dirname(root_file)
        root_cache[path] = root
    end

    vim.fn.chdir(root)
end

local root_augroup = vim.api.nvim_create_augroup("AutoRoot", {})
vim.api.nvim_create_autocmd("BufEnter", { callback = set_root })
