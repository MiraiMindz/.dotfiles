local highlights = require "custom.configs.highlights"

---@type ChadrcConfig
local M = {}
  M.ui = {
    -- Styling
    theme = "catppuccin",
    transparency = true,
    cheatsheet = {
    theme = "grid",
  },
  statusline = {
    theme = "vscode_colored", -- I want the minimal round, but it's buggy rn.
    separator_style = "round",
  },
  tabufline = {
    show_numbers = true,
    enabled = true,
    lazyload = true,
  },
  nvdash = {
    load_on_startup = true,
    header = {
      "██████████████████████████████████████████████████████████████████████████████████",
      "████████      ▀████       ███     ███            ███████      ██████     █████████",
      "████████       ████       ███     ███    ████     █████        █████     █████████",
      "████████       ████       ███     ███    ████     █████   ▄    █████     █████████",
      "████████        ██   █    ███     ███    ████     ████    █    ▀████     █████████",
      "█                                                                                █",
      "█████████████████████████████████████       ██████████████████████████████████████",
      "████████    █       ██    ███         █   █   ▀██████    ████    ███     █████████",
      "████████    ██      ██    ███      ▄███   ███    ████            ███     █████████",
      "████████    ██     ▄██    ███    ████     ███      ▀███▄▄▄▄▄▄     ██     █████████",
      "████████    ██▄    ███    ▀   ▄██████     ███         ███████     ██     █████████",
      "████████    ███    ███      ██    ███     ███     █     ▀█████    ██     █████████",
      "███████████████████████  ▄█████████████   █████████████   ████████████████████████",
      "███████████████████████████████████████   ████████████████████████████████████████",
      "███████████████████████████████████████   ████████████████████████████████████████",
      "██████████████████████████████████████████████████████████████████████████████████"
    },
    buttons = {
      { "  Find File", "Spc f f", "Telescope find_files" },
      { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
      { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
      { "  Bookmarks", "Spc m a", "Telescope marks" },
      { "  Themes", "Spc t h", "Telescope themes" },
      { "  Mappings", "Spc c h", "NvCheatsheet" },
    },
  },

    -- Highlighting
    hl_override = highlights.override,
    hl_add = highlights.add,


    -- LSP Settings
    lsp_semantic_tokens = true,
    lsp = {
      signature = {
        silent = true,
        disabled = false,
      },
    },
  }

  M.plugins = "custom.plugins"
  M.mappings = require "custom.mappings"
return M
