vim.g.mapleader = " "

require("remaps")
require("options")
require("autocmds")
require("filetypes")

require("lazy_setup")
require("language_servers")
require("snippets")

vim.cmd.colorscheme("mellow")
