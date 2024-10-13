local lsp = require("lsp-zero")

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'tsserver', 'rust_analyzer','eslint',},
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
  },
})


lsp.preset("recommended")

--lsp.ensure_installed({
--  'tsserver',
--  'eslint',
--  'sumneko_lua',
--  'rust_analyzer',
--})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

  cmp.setup({
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },

    --    local cmp_mappings = lsp.defaults.cmp_mappings({
	mappping = cmp.mapping.preset.insert({
	    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	    ['<CR>'] = cmp.mapping.confirm({select = false}),
	    ["<C-Space>"] = cmp.mapping.complete(),
    }),
    preselect = 'item',
    completion = {
	    completeopt = 'menu,menuone,noinsert'
    },
    })
lsp.set_preferences({
  sign_icons = { }
})

--lsp.setup_nvim_cmp({
-- mapping = cmp_mappings
--})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()
