vim.g.mapleader = " "

require("remaps")
require("options")
require("autocmds")
require("lazy_setup")
require("language_servers")
require("snippets")

vim.cmd.colorscheme("catppuccin")
