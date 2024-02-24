-- Here are the plugins that modifies the UI of the editor

local CONFIG_BASE_DIR = "mirai.plugins."

local M = {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		lazy = false,
		config = require(CONFIG_BASE_DIR .. "catppuccin"),
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup(require(CONFIG_BASE_DIR .. "lualine"))
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local signs = {
				-- Error = " ",
				Error = " ",
				Warn = " ",
				Hint = " ",
				Info = " ",
			}

			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end
			require("trouble").setup(require(CONFIG_BASE_DIR .. "trouble"))
		end,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function()
			require("noice").setup(require(CONFIG_BASE_DIR .. "noice"))
		end,
	},
	{
		"stevearc/dressing.nvim",
		config = function()
			require("dressing").setup(require(CONFIG_BASE_DIR .. "dressing"))
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("todo-comments").setup(require(CONFIG_BASE_DIR .. "todoComments"))
		end,
	},
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")
			dashboard.section.header.val = {
				"                                                                       ",
				"                                                                     ",
				"       ████ ██████           █████      ██                     ",
				"      ███████████             █████                             ",
				"      █████████ ███████████████████ ███   ███████████   ",
				"     █████████  ███    █████████████ █████ ██████████████   ",
				"    █████████ ██████████ █████████ █████ █████ ████ █████   ",
				"  ███████████ ███    ███ █████████ █████ █████ ████ █████  ",
				" ██████  █████████████████████ ████ █████ █████ ████ ██████ ",
				"                                                                       ",
				"═══════════════════════════════════════════════════════════════════════",
				"オ        ム        ニ        エ        デ        ィ        タ       ー",
			}
			alpha.setup(dashboard.opts)
		end,
	},
	{
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup({
				mappings = {},
			})
		end,
	},
	{
		"Bekaboo/dropbar.nvim",
		-- optional, but required for fuzzy finder support
		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
		},
	},
	{
		"shellRaining/hlchunk.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		event = { "UIEnter" },
		config = function()
			require("hlchunk").setup(require(CONFIG_BASE_DIR .. "hlchunk"))
		end,
	},
	-- {
	--     'nvimdev/lspsaga.nvim',
	--     config = function()
	--         require('lspsaga').setup(require(CONFIG_BASE_DIR .. lspsaga))
	--     end,
	--     dependencies = {
	--         'nvim-treesitter/nvim-treesitter',
	--         'nvim-tree/nvim-web-devicons',
	--     }
	-- }
}

return M
