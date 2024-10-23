-- vim.g.mapleader = " "

-- Neo-Tree
vim.keymap.set("n", "<leader>nw" ,"<CMD>Neotree<CR>")
vim.keymap.set("n", "<leader>no" ,"<CMD>Neotree buffers<CR>")

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.cmd([[set scrolloff=15]])
