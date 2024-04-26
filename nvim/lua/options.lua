-- relative numbers and current line
vim.opt.nu = true
vim.opt.relativenumber = true

-- ruler
vim.opt.colorcolumn = "80"

-- use gui colors
vim.opt.termguicolors = true

-- prettier search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- stop buffer from jiggling
vim.o.signcolumn = "number"

-- hide the current mode from the statusline
vim.opt.showmode = false

-- invisible characters
vim.opt.listchars = {
    tab = "↠··",
    lead = "·",
    space = "·",
    multispace = "····",
    leadmultispace = "⬝···",
}

vim.opt.list = true

-- concealing
vim.opt.conceallevel = 2

-- default indenting
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- default split on right
vim.opt.splitright = true

-- top and bottom padding
vim.opt.scrolloff = 12

-- no swapfiles
vim.opt.swapfile = false
vim.opt.backup = false

-- no wrapping around
vim.opt.wrap = false
