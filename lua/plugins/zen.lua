return {
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      styles = {
        zen = {
          enter = true,
          fixbuf = false,
          minimal = false,
          width = 120,
          height = 0,
          backdrop = { transparent = false, blend = 10 },
          keys = { q = false },
          zindex = 40,
          wo = {
            winhighlight = "NormalFloat:Normal",
          },
          w = {
            snacks_main = true,
          },
        },
      },
    },
  },
}
