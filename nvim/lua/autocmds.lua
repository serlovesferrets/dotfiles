vim.api.nvim_create_autocmd("BufEnter", {
	desc = "Disables the automatic continuation of comments on newlines",
	callback = function()
		vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
	end,
})
