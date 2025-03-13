require("jarred")

vim.env.PATH = vim.env.PATH .. ':/snap/bin/'
vim.wo.relativenumber = true
vim.wo.number = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.opt.clipboard = "unnamedplus"
vim.o.conceallevel = 1
vim.o.ignorecase = true

vim.lsp.set_log_level("debug")

vim.api.nvim_create_user_command("DiagnosticToggle", function()
	local config = vim.diagnostic.config
	local vt = config().virtual_text
	config {
		virtual_text = not vt,
		underline = not vt,
		signs = not vt,
	}
end, { desc = "toggle diagnostic" })


vim.filetype.add({
  extension = {
    ['http'] = 'http',
  },
})
