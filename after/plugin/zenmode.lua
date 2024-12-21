
-- require("zen-mode").setup({
--     window = {
--         width = 80, -- Set the desired width for Zen Mode
--         options = {}
--     },
--     on_open = function()
--         -- Change Kitty font size when Zen Mode opens
--         os.execute("kitty @ set-font-size 18") -- Replace 18 with your desired Zen Mode font size
--     end,
--     on_close = function()
--         -- Reset Kitty font size when Zen Mode closes
--         os.execute("kitty @ set-font-size 14") -- Replace 12 with your default font size
--     end
-- })


require("zen-mode").setup({
  window = {
    backdrop = 0.95,
    width = 100, -- width of the Zen window
    height = 1, -- height of the Zen window
    options = {
      -- signcolumn = "no", -- disable signcolumn
      -- number = false, -- disable number column
      -- relativenumber = false, -- disable relative numbers
      -- cursorline = false, -- disable cursorline
      -- cursorcolumn = false, -- disable cursor column
      -- foldcolumn = "0", -- disable fold column
      -- list = false, -- disable whitespace characters
    },
  },
  plugins = {
    -- disable some global vim options (vim.o...)
    -- comment the lines to not apply the options
    options = {
      enabled = true,
      ruler = false, -- disables the ruler text in the cmd line area
      showcmd = false, -- disables the command in the last line of the screen
      -- you may turn on/off statusline in zen mode by setting 'laststatus' 
      -- statusline will be shown only if 'laststatus' == 3
      laststatus = 0, -- turn off the statusline in zen mode
    },
    twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
    gitsigns = { enabled = false }, -- disables git signs
    -- tmux = { enabled = false }, -- disables the tmux statusline
    todo = { enabled = false }, -- if set to "true", todo-comments.nvim highlights will be disabled
    -- this will change the font size on kitty when in zen mode
    -- to make this work, you need to set the following kitty options:
    -- - allow_remote_control socket-only
    -- - listen_on unix:/tmp/kitty
    kitty = {
      enabled = true,
      font = "+4", -- font size increment
    },
  },
  -- callback where you can add custom code when the Zen window opens
  on_open = function()
      print(vim.env.KITTY_LISTEN_ON)
      print(vim.env.TMUX)
  end,
    on_close = function()
        if vim.env.TMUX then
            -- Use Lua's io.popen instead of os.execute
            local handle = io.popen("kitty @ set-font-size 14")
            if handle then handle:close() end
        else
            os.execute("kitty @ set-font-size 14")
        end
    end})
