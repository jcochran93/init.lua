return {
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      default_file_explorer = true,
      view_options = { show_hidden = true },
      skip_confirm_for_simple_edits = true,
      keymaps = {
        ["<C-h>"] = false,
        ["<C-l>"] = false,
      },
    },
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  },
}
