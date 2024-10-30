-- vim.g.mapleader = " "

-- Neo-Tree
vim.keymap.set("n", "<leader>nw" ,"<CMD>Neotree<CR>")
vim.keymap.set("n", "<leader>no" ,"<CMD>Neotree buffers<CR>")

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<C-s>", "ggVG")

-- Keep cursor centered when moving up/down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Oil 
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })


vim.cmd([[set scrolloff=15]])
