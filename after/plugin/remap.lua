-- vim.g.mapleader = " "


-- Keep cursor centered when moving up/down
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Easier navigation to start/end of line
vim.keymap.set('n', 'H', '^')
vim.keymap.set('n', 'L', '$')

-- Oil
vim.keymap.set("n", "-", "<CMD>Oil<CR>")

-- Treesitter
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>fs', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', '<leader>fu', builtin.lsp_references, {})

-- Neo-Tree
vim.keymap.set("n", "<leader>nw" ,"<CMD>Neotree<CR>")
vim.keymap.set("n", "<leader>no" ,"<CMD>Neotree buffers<CR>")

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Obsidian 
vim.keymap.set('n', '<leader>of', ':ObsidianQuickSwitch<CR>', { desc = 'Quick switch between Obsidian files' })
vim.keymap.set('n', '<leader>os', ':ObsidianSearch<CR>', { desc = 'Search through Obsidian notes' })
vim.keymap.set('n', '<leader>on', ':ObsidianNew<CR>', { desc = 'Create a new Obsidian note' })
vim.keymap.set('n', '<leader>ot', ':ObsidianTemplate<CR>', { desc = 'Insert an Obsidian template' })
vim.keymap.set('n', '<leader>ol', ':ObsidianLink<CR>', { desc = 'Create a link to another note' })
vim.keymap.set('n', '<leader>ob', ':ObsidianBacklinks<CR>', { desc = 'Show backlinks for current note' })
vim.keymap.set('n', '<leader>od', function()
  vim.cmd('ObsidianToday')
end, { desc = 'Create or open today\'s daily note' })

-- Insert tags easily
vim.keymap.set('n', '<leader>tt', 'a#', { desc = 'Insert a tag' })

-- Zenmode
vim.keymap.set('n', '<leader>zm', ':ZenMode<CR>', { desc = 'Toggle for ZenMode' })
vim.keymap.set('n', '<leader>zt', ':Twilight<CR>', { desc = 'Toggle for Twilight' })

-- Kulala
-- vim.keymap.set('n', '<CR>', '<cmd>lua require("kulala").run()<cr>', { noremap = true, silent = true, desc = "Execute the request" })

vim.cmd([[set scrolloff=15]])
