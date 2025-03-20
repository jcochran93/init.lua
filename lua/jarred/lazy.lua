-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)


vim.g.mapleader = " "
vim.g.maplocalleader = "\\"


local plugins = {
    {"mfussenegger/nvim-dap",
        dependencies = { "nvim-neotest/nvim-nio", "rcarriga/nvim-dap-ui" , }
    },
    { 'nicholasmata/nvim-dap-cs', dependencies = { 'mfussenegger/nvim-dap' } },
	{
		"nvim-telescope/telescope.nvim",
		version = "0.1.6",
		-- or                            , branch = '0.1.x',
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},
	"navarasu/onedark.nvim",
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	"theprimeagen/harpoon",
	{
		"williamboman/mason.nvim",
	},
	{
		"VonHeikemen/lsp-zero.nvim",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    },
    'mbbill/undotree',
    'tpope/vim-fugitive',
    {
        'numToStr/Comment.nvim',
        opts = {}
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    },
    -- lazy.nvim
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        }
    },{
        'stevearc/oil.nvim',
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {},
        -- Optional dependencies
        -- dependencies = { { "echasnovski/mini.icons", opts = {} } },
        dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    },
    -- Obsidian
    {
        'renerocksai/telekasten.nvim',
        dependencies = {'nvim-telescope/telescope.nvim'}
    },
    {
        "epwalsh/obsidian.nvim",
        version = "*",  -- recommended, use latest release instead of latest commit
        lazy = true,
        ft = "markdown",
        -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
        -- event = {
            --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
            --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
            --   -- refer to `:h file-pattern` for more examples
            --   "BufReadPre path/to/my-vault/*.md",
            --   "BufNewFile path/to/my-vault/*.md",
            -- },
            dependencies = {
                -- Required.
                "nvim-lua/plenary.nvim",

                -- see below for full list of optional dependencies 👇
            },

                -- see below for full list of options 👇
            },

	{
		"kevinhwang91/nvim-ufo",
		dependencies = {
			"kevinhwang91/promise-async",
			"nvim-treesitter/nvim-treesitter",
		},

		after = "nvim-lspconfig",
	}, -- Lua
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			bigfile = { enabled = true },
			dashboard = { enabled = true },
			indent = { enabled = true },
			input = { enabled = true },
			notifier = { enabled = true },
			quickfile = { enabled = true },
			scroll = { enabled = true },
			statuscolumn = { enabled = true },
			words = { enabled = true },
            lazygit = {
                -- automatically configure lazygit to use the current colorscheme
                -- and integrate edit with the current neovim instance
                configure = true,
                -- extra configuration for lazygit that will be merged with the default
                -- snacks does NOT have a full yaml parser, so if you need `"test"` to appear with the quotes
                -- you need to double quote it: `"\"test\""`
                -- config = {
                --     os = { editPreset = "nvim-remote" },
                --     gui = {
                --         -- set to an empty string "" to disable icons
                --         nerdFontsVersion = "3",
                --     },
               -- },
                -- Theme for lazygit
                theme = {
                    [241]                      = { fg = "Special" },
                    activeBorderColor          = { fg = "MatchParen", bold = true },
                    cherryPickedCommitBgColor  = { fg = "Identifier" },
                    cherryPickedCommitFgColor  = { fg = "Function" },
                    defaultFgColor             = { fg = "Normal" },
                    inactiveBorderColor        = { fg = "FloatBorder" },
                    optionsTextColor           = { fg = "Function" },
                    searchingActiveBorderColor = { fg = "MatchParen", bold = true },
                    selectedLineBgColor        = { bg = "Visual" }, -- set to `default` to have no background colour
                    unstagedChangesColor       = { fg = "DiagnosticError" },
                },
                win = {
                    style = "lazygit",
                },
            },
		},
		keys = {
			{ "<leader>z", function() Snacks.zen() end, desc = "Toggle Zen Mode", },
			{ "<leader>Z", function() Snacks.zen.zoom() end, desc = "Toggle Zoom", },
			{ "<leader>.", function() Snacks.scratch() end, desc = "Toggle Scratch Buffer", },
			{ "<leader>S", function() Snacks.scratch.select() end, desc = "Select Scratch Buffer", },
			{ "<leader>n", function() Snacks.notifier.show_history() end, desc = "Notification History", },
			{ "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer", },
			{ "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File", },
			{ "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v" }, },
			{ "<leader>gb", function() Snacks.git.blame_line() end, desc = "Git Blame Line", },
			{ "<leader>gf", function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File History", },
			{ "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit", },
			{ "<leader>gl", function() Snacks.lazygit.log() end, desc = "Lazygit Log (cwd)", },
			{ "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications", },
			{ "<c-/>", function() Snacks.terminal() end, desc = "Toggle Terminal", mode = {"n", "t"}, },
			{ "<c-_>", function() Snacks.terminal() end, desc = "which_key_ignore", },
			{ "]]", function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" }, },
			{ "[[", function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" }, },
		},
	},
    { 'echasnovski/mini.ai', version = '*' },
    { 'mistweaverco/kulala.nvim', opts = {} },
    {
      "oysandvik94/curl.nvim",
      cmd = { "CurlOpen" },
      dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = true,
    },
    {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
},
{
    "christoomey/vim-tmux-navigator",
    cmd = {
        "TmuxNavigateLeft",
        "TmuxNavigateDown",
        "TmuxNavigateUp",
        "TmuxNavigateRight",
        "TmuxNavigatePrevious",
        "TmuxNavigatorProcessList",
    },
    keys = {
        { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
        { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
        { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
        { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
        { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
},
-- {
--     "nvim-neo-tree/neo-tree.nvim",
--     branch = "v3.x",
--     dependencies = {
--         "nvim-lua/plenary.nvim",
--         "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
--         "MunifTanjim/nui.nvim",
--         -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
--     },
--     lazy = false, -- neo-tree will lazily load itself
--     ---@module "neo-tree"
--     ---@type neotree.Config?
--     opts = {
--         -- fill any relevant options here
--     },
-- }
}

    require("lazy").setup(plugins, {})
