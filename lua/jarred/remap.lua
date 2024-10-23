-- vim.g.mapleader = " "

-- Neo-Tree
vim.keymap.set("n", "<leader>nw" ,"<CMD>Neotree<CR>")
vim.keymap.set("n", "<leader>no" ,"<CMD>Neotree buffers<CR>")

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<C-a>", "ggVG")


vim.cmd([[set scrolloff=15]])
