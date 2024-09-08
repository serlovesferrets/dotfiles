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

-- Stolen from 
-- https://stackoverflow.com/questions/75963628/how-to-add-an-empty-space-in-the-neovim-at-the-bottom-of-the-buffer-when-using-t
-- tysm!!
vim.api.nvim_create_autocmd({ "CursorMoved" }, {
  callback = function()

    -- normal buffer (not terminal or prompt)
    if vim.bo.buftype ~= "" then
      return
    end

    local windowLines = vim.api.nvim_win_get_height(0)
    local currLine = vim.fn.line(".")
    local lastLine = vim.fn.line("$")

    -- to handle a file smaller than window
    local bottom = 0
    if windowLines > lastLine then
      bottom = windowLines
    else
      bottom = lastLine
    end

    local marginBottom = currLine + vim.o.scrolloff - bottom
    if marginBottom == 0 then
      vim.api.nvim_input("zb")                    -- align cursor with bottom of file
    elseif marginBottom > 0 then
      vim.api.nvim_input("zb")                    -- align cursor with bottom of file
      vim.api.nvim_input(marginBottom .. "<C-E>") -- scroll down
    end
  end,
})
