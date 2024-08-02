-- relative numbers and current line
vim.opt.nu = true
vim.opt.relativenumber = true

-- ruler
vim.opt.colorcolumn = "80"

-- use gui colors
vim.opt.termguicolors = true
vim.o.termguicolors = true

-- prettier search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- stop buffer from jiggling
-- extra space for gitsigns
vim.opt.signcolumn = "yes:1"

-- hide the current mode from the statusline
vim.opt.showmode = false

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
vim.opt.scrolloff = 8

-- no swapfiles
vim.opt.swapfile = false
vim.opt.backup = false

-- no wrapping around
vim.opt.wrap = false

-- I use a plugin for inline errors
vim.diagnostic.config({
  virtual_text = false,
})
