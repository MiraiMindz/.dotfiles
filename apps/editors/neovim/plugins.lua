local overrides = require("custom.configs.overrides")
local highlights = require("custom.configs.highlights")

---@type NvPluginSpec[]
local plugins = {
	-- Adding the official Catppuccin Theme Plugin
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		lazy = false,
		config = function()
			require("catppuccin").setup(highlights.catppuccin)
			vim.cmd.colorscheme("catppuccin")
		end,
	},

	-- Overwriting default plugins configs
	{
		"hrsh7th/nvim-cmp",
		opts = overrides.cmp,
	},
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
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
					require("custom.configs.null-ls")
				end,
			},
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
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
		end,
	},

	{
		"JunioJsv/portugol-support-vim",
		ft = "por",
	},

	{
		"ellisonleao/glow.nvim",
		config = true,
		cmd = "Glow",
	},

	{
		"windwp/nvim-ts-autotag",
		opts = overrides.autotag,
	},
	{
		"tpope/vim-surround",
		cmd = "Surr",
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
		"tomiis4/Hypersonic.nvim",
		event = "CmdlineEnter",
		cmd = "Hypersonic",
		config = function()
			require("hypersonic").setup({
				---@type 'none'|'single'|'double'|'rounded'|'solid'|'shadow'|table
				border = "rounded",
				---@type number 0-100
				winblend = 0,
				---@type boolean
				add_padding = true,
				---@type string
				hl_group = "Keyword",
				---@type string
				wrapping = '"',
				---@type boolean
				enable_cmdline = true,
			})
		end,
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
					enable = false,
				},
				line_num = {
					enable = false,
					style = "#cba6f7",
				},
				blank = {
					enable = false,
				},
			})
		end,
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
		config = function(_, opts)
			require("compiler").setup(opts)
		end,
	},
	{ -- The framework we use to run tasks
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
					["q"] = function()
						vim.cmd("OverseerClose")
					end,
				},
			},
		},
		config = function(_, opts)
			require("overseer").setup(opts)
		end,
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
			},
		},
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		config = function()
			require("noice").setup({
				lsp = {
					lsp_progress_done = { bg = "blue" },
					lsp_progress = { bg = "blue" },
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
					signature = {
						enabled = false,
					},
					hover = {
						enabled = false,
					},
				},
				presets = {
					bottom_search = true, -- use a classic bottom cmdline for search
					command_palette = true, -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = false, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = false, -- add a border to hover docs and signature help
				},
				views = {
					cmdline_popup = {
						position = {
							row = 5,
							col = "50%",
						},
						size = {
							width = 60,
							height = "auto",
						},
					},
					popupmenu = {
						relative = "editor",
						position = {
							row = 8,
							col = "50%",
						},
					},
					size = {
						width = 60,
						height = 10,
					},
					border = {
						style = "rounded",
						padding = { 0, 1 },
					},
					win_options = {
						winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
					},
					mini = {
						win_options = {
							winblend = 0,
						},
					},
				},
			})
			--require("noice").setup({lsp = { signature = { enabled = false }}})
			--require("noice").setup({lsp = { hover = { enabled = false }}})
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
	{
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup({
				background_colour = "#1e1e2e",
			})
		end,
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
			require("pretty-fold").setup({
				ft_ignore = {
					"nvdash",
					"terminal",
					"NvimTree",
					"nvcheatsheet",
				},
			})
		end,
	},
	{
		"mfussenegger/nvim-dap",
		event = "VeryLazy",
		init = function()
			require("core.utils").load_mappings("dap")
		end,
	},
	{
		"leoluz/nvim-dap-go",
		ft = { "go" },
		dependencies = { "mfussenegger/nvim-dap" },
		config = function(_, opts)
			require("dap-go").setup(opts)
			require("core.utils").load_mappings("dap_go")
		end,
	},
	{
		"olexsmir/gopher.nvim",
		ft = { "go" },
		dependencies = { "mfussenegger/nvim-dap" },
		config = function(_, opts)
			require("gopher").setup(opts)
			require("core.utils").load_mappings("gopher")
		end,
		build = function()
			vim.cmd([[silent! GoInstallDeps]])
		end,
	},
	{
		"mfussenegger/nvim-dap-python",
		ft = { "python" },
		dependencies = {
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",
		},
		config = function(_, opts)
			require("dap-python").setup(opts)
			local path = "$HOME/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
			require("dap-python").setup(path)
			require("core.utils").load_mappings("dap_python")
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		config = function(_, opts)
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
	{
		"rust-lang/rust.vim",
		ft = { "rust" },
		init = function()
			vim.g.rustfmt_autosave = 1
		end,
	},
	{
		"simrat39/rust-tools.nvim",
		ft = { "rust" },
		dependencies = { "neovim/nvim-lspconfig" },
		opts = function()
			return require("custom.configs.rust-tools")
		end,
		config = function(_, opts)
			require("rust-tools").setup(opts)
		end,
	},
	{
		"saecki/crates.nvim",
		dependencies = { "hrsh7th/nvim-cmp" },
		ft = { "rust", "toml" },
		config = function(_, opts)
			local crates = require("crates")
			crates.setup(opts)
			crates.show()
		end,
	},
}

return plugins
