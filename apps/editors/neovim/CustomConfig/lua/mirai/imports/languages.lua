-- Here are the language-specific plugins

local M = {
	{
		"ray-x/go.nvim",
		lazy = true,
		dependencies = { -- optional packages
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("go").setup()
		end,
		event = { "CmdlineEnter" },
		ft = { "go", "gomod", "gowork" },
		build = ':lua require("go.install").update_all_sync()',
	},
	{
		"olexsmir/gopher.nvim",
		lazy = true,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		ft = { "go", "gomod", "gowork" },
		config = function()
			require("gopher").setup()
		end,
	},
	{
		"rust-lang/rust.vim",
		lazy = true,
		ft = { "rust" },
		init = function()
			vim.g.rustfmt_autosave = 1
		end,
	},
	{
		"mrcjkb/rustaceanvim",
		lazy = true,
		version = "^4", -- Recommended
		ft = { "rust" },
	},
	{
		"saecki/crates.nvim",
		lazy = true,
		dependencies = { "hrsh7th/nvim-cmp" },
		ft = { "rust", "toml" },
		config = function(_, opts)
			local crates = require("crates")
			crates.setup(opts)
			crates.show()
		end,
	},
}

return M
