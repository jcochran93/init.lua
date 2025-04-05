require("conform").setup({
 format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 2500,
    lsp_format = "fallback",
  },
  formatters_by_ft ={
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    python = { "isort", "black" },
    -- You can customize some of the format options for the filetype (:help conform.format)
    rust = { "rustfmt", lsp_format = "fallback" },
    -- Conform will run the first available formatter
    javascript = { "prettierd", "prettier", stop_after_first = true },
    typescript = { "biome", "prettierd", "prettier", stop_after_first = true },
    cs = {"csharpier"},
    json = { "prettierd", "prettier", stop_after_first = true },
  },format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_format = "fallback",
  },
  formatters = {
    csharpier = {
      timeout = 10000,  -- Increase from default (likely 1000ms) to 10 seconds
    },
  },
})


vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})
