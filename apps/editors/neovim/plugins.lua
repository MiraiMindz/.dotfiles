local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {
  -- Overwriting default plugins configs
  {
    "hrsh7th/nvim-cmp",
    opts = overrides.cmp
  },
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- Custom Plugins
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "andweeb/presence.nvim",
    event = "VeryLazy",
    -- config = function()
    --  require("presence").setup(overrides.presence)
    -- end
  },

  {
    "JunioJsv/portugol-support-vim",
    ft = "por"
  },

  {
    "ellisonleao/glow.nvim",
    config = true,
    cmd = "Glow"
  },

  {
    "windwp/nvim-ts-autotag",
    opts = overrides.autotag
  },
  {
    "tpope/vim-surround",
    cmd = "Surr"
  },
  {
    "Exafunction/codeium.vim",
    lazy = false,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          -- default options: exact mode, multi window, all directions, with a backdrop
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "o", "x" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
    },
  },
  {
    'tomiis4/Hypersonic.nvim',
    event = "CmdlineEnter",
    cmd = "Hypersonic",
    config = function()
      require('hypersonic').setup({
      ---@type 'none'|'single'|'double'|'rounded'|'solid'|'shadow'|table
      border = 'rounded',
      ---@type number 0-100
      winblend = 0,
      ---@type boolean
      add_padding = true,
      ---@type string
      hl_group = 'Keyword',
      ---@type string
      wrapping = '"',
      ---@type boolean
      enable_cmdline = true
    })
    end
  },
  {
    "rgroli/other.nvim",
    event="CmdlineEnter",
    cmd="Other",
  },
  {
    "shellRaining/hlchunk.nvim",
    event = "UIEnter",
    config = function()
      require("hlchunk").setup({
        chunk = {
          enable = true,
          use_treesitter = true,
          chars = {
            horizontal_line = "─",
            vertical_line = "│",
            left_top = "╭",
            left_bottom = "╰",
            right_arrow = ">",
          },
          style = "#cba6f7",
        },
        indent = {
          enable = false
        },
        line_num = {
          enable = false,
          style = "#cba6f7",
        },
        blank = {
          enable = false
        }
      })
    end
  },
  {
    "Bekaboo/dropbar.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-web-devicons",
    },
  },
  { -- This plugin
    "zeioth/compiler.nvim",
    dependencies = { "stevearc/overseer.nvim" },
    cmd = {"CompilerOpen", "CompilerToggleResults"},
    config = function(_, opts) require("compiler").setup(opts) end,
  },
  { -- The framework we use to run tasks
    "stevearc/overseer.nvim",
    commit = "3047ede61cc1308069ad1184c0d447ebee92d749", -- Recommended to to avoid breaking changes
    cmd = {"CompilerOpen", "CompilerToggleResults"},
    opts = {
      -- Tasks are disposed 5 minutes after running to free resources.
      -- If you need to close a task inmediatelly:
      -- press ENTER in the menu you see after compiling on the task you want to close.
      task_list = {
        direction = "bottom",
        min_height = 25,
        max_height = 25,
        default_detail = 1,
        bindings = {
          ["q"] = function() vim.cmd("OverseerClose") end ,
        },
      },
    },
    config = function(_, opts) require("overseer").setup(opts) end,
  },
}

return plugins
