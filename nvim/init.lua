vim.g.mapleader = " "

require("options")
require("autocmds")
require("filetypes")

require("lazy_setup")
require("language_servers")

vim.cmd.colorscheme("mellow")

vim.api.nvim_set_hl(0, "Comment", { fg = "#b8afcf", bg = "#221d30" })
