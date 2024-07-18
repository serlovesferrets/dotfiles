vim.g.mapleader = " "

require("remaps")
require("options")
require("autocmds")
require("filetypes")

require("lazy_setup")
require("language_servers")
require("snippets")

vim.cmd.colorscheme("mellow")

vim.api.nvim_set_hl(0, "Comment", { fg = "#FA7CA6", bg = "#310212" })
