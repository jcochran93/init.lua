local lsp = require("lsp-zero")

local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({ buffer = bufnr })
end)

require("mason").setup({})
require("mason-lspconfig").setup({
  -- ensure_installed = {'omnisharp',},
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require("lspconfig").lua_ls.setup(lua_opts)
    end,
    -- omnisharp = function()
    --     require('lspconfig').omnisharp.setup({
    --         on_attach = lsp_zero.on_attach,
    --         capabilities = lsp_zero.capabilities,
    --         -- Enable this if you're getting file watching errors on Linux
    --         -- enable_editorconfig_support = true,
    --     })
    -- end,
  },
})

local lspconfig = require("lspconfig")

-- -- For omnisharp:
-- lspconfig.omnisharp.setup{
--   cmd = { "omnisharp" },
--   -- Optional settings:
--   filetypes = { "cs", "vb" },
--   root_dir = lspconfig.util.root_pattern("*.sln", "*.csproj", ".git")
-- }

lspconfig.csharp_ls.setup({
  -- Basic configuration
  on_attach = on_attach,
  cmd = { "csharp-ls" },
  init_options = {
    -- Explicitly specify MSBuild path
    msbuildPath = "C:\\Program Files\\Microsoft Visual Studio\\2022\\Professional\\MSBuild\\Current\\Bin\\MSBuild.exe",
  },
  filetypes = { "cs" },
  root_dir = lspconfig.util.root_pattern("*.sln", "*.csproj", ".git"),
  init_options = {
    AutomaticWorkspaceInit = true,
  },
  -- Increase timeouts if needed for Windows filesystem access
  settings = {
    -- Any specific settings can go here
  },

  -- If you're experiencing slow performance, you can adjust these
  flags = {
    debounce_text_changes = 150,
  },
})

-- lsp.preset("recommended")

--lsp.ensure_installed({
--  'tsserver',
--  'eslint',
--  'sumneko_lua',
--  'rust_analyzer',
--})

-- local cmp = require("cmp")
-- local cmp_select = { behavior = cmp.SelectBehavior.Select }
-- local cmp_action = require("lsp-zero").cmp_action()
--
-- cmp.setup({
--   sources = {
--     { name = "nvim_lsp" },
--     { name = "buffer" }, -- Words from the current buffer
--     { name = "path" }, -- File paths
--     { name = "luasnip" }, -- Snippet completions (requires a snippet engine like LuaSnip)
--     { name = "nvim_lsp_signature_help" },
--   },
--   snippet = {
--     expand = function(args)
--       require("luasnip").lsp_expand(args.body)
--     end,
--   },
--   window = {
--     completion = cmp.config.window.bordered(),
--     documentation = cmp.config.window.bordered(),
--   },
--   mapping = cmp.mapping.preset.insert({
--     ["<C-b>"] = cmp.mapping.scroll_docs(-4),
--     ["<C-f>"] = cmp.mapping.scroll_docs(4),
--     ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
--     ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
--     ["<C-Space>"] = cmp.mapping.complete(),
--     ["<CR>"] = cmp.mapping.confirm({ select = false }),
--     ["<Tab>"] = cmp_action.tab_complete(),
--   }),
--
--   preselect = "item",
--   completion = {
--     completeopt = "menu,menuone,noinsert",
--   },
-- })

-- lsp.set_preferences({
-- 	sign_icons = { }
-- })

-- lsp.setup_nvim_cmp({
--  mapping = cmp_mappings
-- })

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function()
    vim.lsp.buf.definition()
  end, opts)
  vim.keymap.set("n", "K", function()
    vim.lsp.buf.hover()
  end, opts)
  vim.keymap.set("n", "<leader>vws", function()
    vim.lsp.buf.workspace_symbol()
  end, opts)
  vim.keymap.set("n", "<leader>vd", function()
    vim.diagnostic.open_float()
  end, opts)
  vim.keymap.set("n", "[d", function()
    vim.diagnostic.goto_next()
  end, opts)
  vim.keymap.set("n", "]d", function()
    vim.diagnostic.goto_prev()
  end, opts)
  vim.keymap.set("n", "<leader>vca", function()
    vim.lsp.buf.code_action()
  end, opts)
  vim.keymap.set("n", "<leader>vrr", function()
    vim.lsp.buf.references()
  end, opts)
  vim.keymap.set("n", "<leader>vrn", function()
    vim.lsp.buf.rename()
  end, opts)
  vim.keymap.set("i", "<C-h>", function()
    vim.lsp.buf.signature_help()
  end, opts)
end)

lsp.setup()
