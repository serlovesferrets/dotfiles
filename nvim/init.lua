vim.g.mapleader = " "

require("remaps")
require("options")
require("autocmds")
require("lazy_setup")
require("language_servers")

vim.cmd.colorscheme("catppuccin")
