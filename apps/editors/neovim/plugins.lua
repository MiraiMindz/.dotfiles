local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {
  -- Adding the official Catppuccin Theme Plugin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        background = {   -- :h background
          light = "latte",
          dark = "mocha",
        },
        transparent_background = true, -- disables setting the background color.
        show_end_of_buffer = false,   -- shows the '~' characters after the end of buffers
        term_colors = false,          -- sets terminal colors (e.g. `g:terminal_color_0`)
        dim_inactive = {
          enabled = false,            -- dims the background color of inactive window
          shade = "dark",
          percentage = 0.15,          -- percentage of the shade to apply to the inactive window
        },
        no_italic = false,            -- Force no italic
        no_bold = false,              -- Force no bold
        no_underline = false,         -- Force no underline
        styles = {                    -- Handles the styles of general hi groups (see `:h highlight-args`):
          comments = { "italic" },    -- Change the style of comments
          conditionals = { "italic" },
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
        },
        color_overrides = {},
        custom_highlights = {},
        integrations = {
          semantic_tokens = true,
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          telescope = true,
          notify = true,
          mini = true,
          mason = true,
          noice = true,
          treesitter_context = true,
          treesitter = true,
          overseer = true,
          lsp_trouble = true,
          which_key = true,
          dropbar = {
            enabled = true,
            color_mode = true, -- enable color for kind's texts, not just kind's icons
          },
          indent_blankline = {
            enabled = true,
            colored_indent_levels = true,
          },
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = { "italic" },
              hints = { "italic" },
              warnings = { "italic" },
              information = { "italic" },
            },
            underlines = {
              errors = { "underline" },
              hints = { "underline" },
              warnings = { "underline" },
              information = { "underline" },
            },
            inlay_hints = {
              background = true,
            },
          },
        },
      })
      vim.cmd.colorscheme 'catppuccin'
    end
  },

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
    config = function()
      require("presence").setup(overrides.presence)
    end
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
    event = "CmdlineEnter",
    cmd = "Other",
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
    cmd = { "CompilerOpen", "CompilerToggleResults" },
    config = function(_, opts) require("compiler").setup(opts) end,
  },
  {                                                      -- The framework we use to run tasks
    "stevearc/overseer.nvim",
    commit = "3047ede61cc1308069ad1184c0d447ebee92d749", -- Recommended to to avoid breaking changes
    cmd = { "CompilerOpen", "CompilerToggleResults" },
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
          ["q"] = function() vim.cmd("OverseerClose") end,
        },
      },
    },
    config = function(_, opts) require("overseer").setup(opts) end,
  },
  {
    "folke/twilight.nvim",
    opts = {
      dimming = {
        alpha = 0.5,
      },
      context = 8,
      treesitter = true,
      expand = {
        "function",
        "method",
        "table",
        "if_statement",
      }
    }
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    config = function()
      require("noice").setup({
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
          signature = {
            enabled = false
          },
          hover = {
            enabled = false
          }
        },
        presets = {
          bottom_search = true,         -- use a classic bottom cmdline for search
          command_palette = true,       -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false,           -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false,       -- add a border to hover docs and signature help
        },
      })
      --require("noice").setup({lsp = { signature = { enabled = false }}})
      --require("noice").setup({lsp = { hover = { enabled = false }}})
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  },
  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({
        background_colour = "#1e1e2e",
      })
    end
  },
  {
    "folke/trouble.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "anuvyklack/pretty-fold.nvim",
    event = "BufWinEnter",
    dependencies = {
      {
        "anuvyklack/fold-preview.nvim",
        dependencies = {
          "anuvyklack/keymap-amend.nvim",
        },
        opts = {
          border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        },
      },
    },
    config = function()
      require('pretty-fold').setup({
        ft_ignore = {
          "nvdash",
          "terminal",
          "NvimTree",
          "nvcheatsheet"
        },
      })
    end
  }
}




return plugins
