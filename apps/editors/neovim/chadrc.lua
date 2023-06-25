---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "catppuccin",
  hl_override = highlights.override,
  hl_add = highlights.add,
  transparency = true,
  lsp_semantic_tokens = true,
  lsp = {
    signature = {
      disabled = false,
      silent = true,
    },
  },
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
  }
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
