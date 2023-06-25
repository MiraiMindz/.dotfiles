local M = {}

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

-- git support in nvimtree
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

return M
