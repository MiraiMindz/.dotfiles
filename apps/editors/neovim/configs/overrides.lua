local M = {}

-- Insure installed
M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "go",
    "bash",
    "yuck",
    "rust",
    "java",
    "c_sharp",
    "ini",
    "zig",
    "rst",
    "kotlin",
    "json",
    "jq",
    "javascript",
  },
  indent = {
    enable = true,
  },
  autotag = {
    enable = true,
  }
}

M.mason = {
  ensure_installed = {
    "asm-lsp",
    "lua-language-server",
    "stylua",
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",
    "clangd",
    "clang-format",
    "golangci-lint-langserver",
    "gofumpt",
    "goimports",
    "gopls",
    "black",
    "clang-format",
    "clangd",
    "commitlint",
    "cpplint",
    "cpptools",
    "css-lsp",
    "deno",
    "eslint-lsp",
    "gh",
    "gitlint",
    "glow",
    "golangci-lint",
    "html-lsp",
    "jq",
    "json-lsp",
    "jsonlint",
    "lua-language-server",
    "markdown-toc",
    "markdownlint",
    "prettier",
    "pydocstyle",
    "pylint",
    "pyment",
    "python-lsp-server",
    "rust-analyzer",
    "rustfmt",
    "shellcheck",
    "stylua",
    "tailwindcss-language-server",
    "tree-sitter-cli",
    "typescript-language-server",
  },
}

-- Git integration into NeoVimTree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

-- CMP Mapping and behaviour change
M.cmp = {
  mapping = {
    -- disable  tab
    ["<Tab>"] = function(callback)
      callback()
    end,
    ["<S-Tab>"] = function(callback)
      callback()
    end,

    -- use Up and down for cycling completion
    ["<Down>"] = require("cmp").mapping(function(fallback)
      local cmp = require "cmp"
      if cmp.visible() then
        cmp.select_next_item()
      elseif require("luasnip").expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
      else
        fallback()
      end
    end, {"i", "s"}),
    ["<Up>"] = require("cmp").mapping(function(fallback)
      local cmp = require "cmp"
      if cmp.visible() then
        cmp.select_prev_item()
      elseif require("luasnip").jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
      else
        fallback()
      end
    end, {"i", "s"}),
  },
}

M.presence = {
  auto_update         = true,
  neovim_image_text   = "How do I exit it?",
  main_image          = "file",
  log_level           = "debug",
  debounce_timeout    = 10,
  enable_line_number  = false,
  buttons             = true,
  show_time           = true,

  -- Rich Presence text options
  editing_text        = "Editing %s",
  file_explorer_text  = "Browsing %s",
  git_commit_text     = "Committing changes",
  plugin_manager_text = "Managing plugins",
  reading_text        = "Reading %s",
  workspace_text      = "Working on %s",
  line_number_text    = "Line %s out of %s"
}

return M
