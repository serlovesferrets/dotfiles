vim.g.mapleader = " "

require("options")
require("autocmds")
require("filetypes")

require("lazy_setup")
require("language_servers")

vim.cmd.colorscheme("mellow")
TweakColorscheme()
