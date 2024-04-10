--[[ This is the third iteration of my neovim config, named: The Single One.
This time my entire config will be a single file that contains everything.

Why am I doing this? Because I've reseted my system and had gone to a minimal
approach, thus this config will be minimal too.

Hope you enjoy it.
                                                                        - Mirai
--]]

-- BASE SECTION

-- Sets the colorscheme to be one of the defauts
-- I've choosed wildcharm cuz looked like an ANSI theme.
vim.cmd.colorscheme("wildcharm")

-- Ensures syntax is enabled
vim.cmd("syntax on")

-- Show relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"
vim.wo.number = true

-- Sets the map key to the <space> key.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- I do not have a nerd font.
vim.g.have_nerd_font = false

-- Enables the mouse
vim.opt.mouse = "a"

-- Disables showing the mode (because it's on the status line)
vim.opt.showmode = false

-- Sync OS & nvim clipboards
vim.opt.clipboard = "unnamedplus"

-- Set highlight on search
vim.o.hlsearch = false

-- Enable break indent
vim.o.breakindent = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- This enables 4 spaces tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Smart identation
vim.opt.smartindent = true

-- Enables SwapFiles
vim.opt.swapfile = true

-- Disables Backups
vim.opt.backup = false

-- Enables Undo-dir
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Enables incremental highlight
vim.opt.incsearch = true

-- Ensures that has at least 8 lines at bottom or top of screen.
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Highlight the 80th column (good for formatting)
vim.opt.colorcolumn = "80"

-- Shows the command
vim.opt.showcmd = false

-- Remove bottom command line
vim.opt.cmdheight = 0

-- Auto Resizes window
vim.api.nvim_create_autocmd("VimResized", { pattern = "*", command = "tabdo wincmd =" })

-- Make the arrow keys go to next or previous line.
vim.cmd([[set whichwrap+=<,>,[,] ]])

-- This enables inlay_hints on LSP in case it fails to load on the plugin conf.
vim.g.inlay_hints_visible = true

-- Enables autosaving excluding certain buffer types
function Is_excluded_buffer(buftype)
	Autosave_excluded_buftypes = {
		"terminal",
		"nofile",
		"help",
		"quickfix",
		"nowrite",
		"acwrite",
	}

	for _, excluded_type in ipairs(Autosave_excluded_buftypes) do
		if buftype == excluded_type then
			return true
		end
	end
	return false
end

vim.cmd("set autowriteall")
vim.api.nvim_create_autocmd("TextChanged", {
	pattern = "<buffer>",
	callback = function()
		local buftype = vim.bo.buftype
		if not Is_excluded_buffer(buftype) then
			vim.cmd("silent write")
		end
	end,
})
vim.api.nvim_create_autocmd("TextChangedI", {
	pattern = "<buffer>",
	callback = function()
		local buftype = vim.bo.buftype
		if not Is_excluded_buffer(buftype) then
			vim.cmd("silent write")
		end
	end,
})

-- Sync current directory and browsing directory
vim.g.netrw_browse_split = 0

-- Disables banner
vim.g.netrw_banner = 0

-- Sets the window to be 30% of screen
vim.g.netrw_winsize = 30

-- Changes the copy command to be recursive
vim.g.netrw_localcopydircmd = "cp -r"

-- Enable filetype plugins
vim.cmd("filetype plugin on")

-- Enables OmniFunction AutoComplete
vim.opt.omnifunc = "syntaxcomplete#Complete"

-- Enables blinking cursor in insert mode
vim.api.nvim_command("set guicursor+=a:blinkon1")

-- Enables current line number coloring
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will show the spaces.
vim.opt.list = true
vim.opt.listchars = { tab = ">> ", trail = "·", nbsp = "␣" }

-- Realtime substitution preview
vim.opt.inccommand = "split"

-- AUTOCOMMANDS

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- KEYMAPS

-- Clear search highlight with ESC
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Clears search highlight with ESC" })

-- Diagnostic Keymaps
vim.keymap.set("n", ",d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", ".d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "]de", vim.diagnostic.open_float, { desc = "Open diagnostic rrror messages" })
vim.keymap.set("n", "]dq", vim.diagnostic.setloclist, { desc = "Open diagnostic quickfix list" })

-- Move focus to window
vim.keymap.set("n", "<C-Left>", "<C-w><C-h>", { desc = "Focus on the left window" })
vim.keymap.set("n", "<C-Right>", "<C-w><C-l>", { desc = "Focus on the right window" })
vim.keymap.set("n", "<C-Down>", "<C-w><C-j>", { desc = "Focus on the lower window" })
vim.keymap.set("n", "<C-Up>", "<C-w><C-k>", { desc = "Focus on the upper window" })

-- PLUGINS

local plugins = {
	{
		"echasnovski/mini.nvim",
		config = function()
			require("mini.ai").setup({ n_lines = 500 })
			require("mini.surround").setup()
		end,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		opts = {
			{
				lsp = {
					-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
					},
				},
				-- you can enable a preset for easier configuration
				presets = {
					bottom_search = true, -- use a classic bottom cmdline for search
					command_palette = true, -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = true, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = true, -- add a border to hover docs and signature help
				},
			},
		},
	},
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			signs = true, -- show icons in the signs column
			sign_priority = 8, -- sign priority
			-- keywords recognized as todo comments
			keywords = {
				FIX = {
					icon = " ", -- icon used for the sign, and in search results
					color = "error", -- can be a hex color, or a named color (see below)
					alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
					-- signs = false, -- configure signs for some keywords individually
				},
				TODO = { icon = " ", color = "info" },
				HACK = { icon = " ", color = "warning" },
				WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
				PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
				NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
				TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
			},
			gui_style = {
				fg = "NONE", -- The gui style to use for the fg highlight group.
				bg = "BOLD", -- The gui style to use for the bg highlight group.
			},
			merge_keywords = true, -- when true, custom keywords will be merged with the defaults
			-- highlighting of the line containing the todo comment
			-- * before: highlights before the keyword (typically comment characters)
			-- * keyword: highlights of the keyword
			-- * after: highlights after the keyword (todo text)
			highlight = {
				multiline = true, -- enable multine todo comments
				multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
				multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
				before = "", -- "fg" or "bg" or empty
				keyword = "wide", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
				after = "fg", -- "fg" or "bg" or empty
				pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
				comments_only = true, -- uses treesitter to match keywords in comments only
				max_line_len = 400, -- ignore lines longer than this
				exclude = {}, -- list of file types to exclude highlighting
			},
			-- list of named colors where we try to extract the guifg from the
			-- list of highlight groups or use the hex color if hl not found as a fallback
			colors = {
				error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
				warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
				info = { "DiagnosticInfo", "#2563EB" },
				hint = { "DiagnosticHint", "#10B981" },
				default = { "Identifier", "#7C3AED" },
				test = { "Identifier", "#FF00FF" },
			},
			search = {
				command = "rg",
				args = {
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
				},
				-- regex that will be used to match keywords.
				-- don't replace the (KEYWORDS) placeholder
				pattern = [[\b(KEYWORDS):]], -- ripgrep regex
				-- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
			},
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				cnagedelete = { text = "~" },
			},
		},
	},
	{
		"numToStr/Comment.nvim",
		lazy = false,
		opts = {
			---Add a space b/w comment and the line
			padding = true,
			---Whether the cursor should stay at its position
			sticky = true,
			---Lines to be ignored while (un)comment
			ignore = nil,
			---LHS of toggle mappings in NORMAL mode
			toggler = {
				---Line-comment toggle keymap
				line = "gcc",
				---Block-comment toggle keymap
				block = "gbc",
			},
			---LHS of operator-pending mappings in NORMAL and VISUAL mode
			opleader = {
				---Line-comment keymap
				line = "gc",
				---Block-comment keymap
				block = "gb",
			},
			---LHS of extra mappings
			extra = {
				---Add comment on the line above
				above = "gcO",
				---Add comment on the line below
				below = "gco",
				---Add comment at the end of line
				eol = "gcA",
			},
			---Enable keybindings
			---NOTE: If given `false` then the plugin won't create any mappings
			mappings = {
				---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
				basic = true,
				---Extra mapping; `gco`, `gcO`, `gcA`
				extra = true,
			},
			---Function to call before (un)comment
			pre_hook = nil,
			---Function to call after (un)comment
			post_hook = nil,
		},
	},
	{
		"folke/which-key.nvim",
		event = "VimEnter",
		config = function()
			require("which-key").setup()
			require("which-key").register({
				["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
				["<leader>d"] = { name = "[D]ocument", _ = "which_key_ignore" },
				["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
				["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
				["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
			})
		end,
	},
	{
		"axkirillov/hbac.nvim",
		config = true,
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")
			harpoon.setup({
				settings = {
					save_on_toggle = false,
					sync_on_ui_close = false,
					key = function()
						return vim.loop.cwd()
					end,
				},
			})
			vim.keymap.set("n", "<leader>a", function()
				harpoon.list().add()
			end)
			vim.keymap.set("n", "<C-e>", function()
				harpoon.ui.toggle_quick_menu(harpoon.list())
			end)

			vim.keymap.set("n", "<leader>z", function()
				harpoon.list().select(1)
			end)
			vim.keymap.set("n", "<leader>x", function()
				harpoon.list().select(2)
			end)
			vim.keymap.set("n", "<leader>c", function()
				harpoon.list().select(3)
			end)
			vim.keymap.set("n", "<leader>v", function()
				harpoon.list().select(4)
			end)

			-- Toggle previous & next buffers stored within Harpoon list
			vim.keymap.set("n", "<C-S-P>", function()
				harpoon.list().prev()
			end)
			vim.keymap.set("n", "<C-S-N>", function()
				harpoon.list().next()
			end)
		end,
	},
	{
		"debugloop/telescope-undo.nvim",
		lazy = true,
		keys = {},
	},
	{
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"debugloop/telescope-undo.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			{
				"nvim-telescope/telescope-ui-select.nvim",
			},
			{
				"nvim-tree/nvim-web-devicons",
				enabled = vim.g.have_nerd_font,
			},
		},
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
					undo = {
						use_delta = true,
						use_custom_command = nil, -- setting this implies `use_delta = false`. Accepted format is: { "bash", "-c", "echo '$DIFF' | delta" }
						diff_context_lines = vim.o.scrolloff,
						entry_format = "state #$ID, $STAT, $TIME",
						time_format = "",
						side_by_side = true,
						layout_strategy = "vertical",
						layout_config = {
							preview_height = 0.8,
						},
					},
					fzf = {
						fuzzy = true, -- false will only do exact matching
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
						case_mode = "smart_case", -- or "ignore_case" or "respect_case"
						-- the default case_mode is "smart_case"
					},
				},
			})

			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "ui-select")
			pcall(require("telescope").load_extension, "undo")
			pcall(require("telescope").load_extension, "hbac")

			-- Keymaps
			local built = require("telescope.builtin")
			vim.keymap.set("n", "<C-f>", built.find_files, { desc = "Find files" })
			vim.keymap.set("n", "<C-g>", built.live_grep, { desc = "Grep files" })
			vim.keymap.set("n", "<C-gw>", built.grep_string, { desc = "Grep current word" })
			vim.keymap.set("n", "<C-sk>", built.keymaps, { desc = "Search through keymaps" })
			vim.keymap.set("n", "<C-/>", function()
				built.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, { desc = "Fuzzy search in current file" })
		end,
	},

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {
			disable_filetype = { "TelescopePrompt", "vim" },
		},
	},

	{
		"rmagatti/auto-session",
		config = function(_, opts)
			require("auto-session").setup(opts)
		end,
		opts = {},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				icons_enabled = true,
				theme = {
					normal = {
						a = { fg = "#ffffff", bg = "#0000ff", gui = "bold" },
						b = { fg = "#ffffff", bg = "#000000" },
						c = { fg = "#C0C0C0", bg = "#000000" },
					},
					insert = { a = { fg = "#ffffff", bg = "#008000", gui = "bold" } },
					visual = { a = { fg = "#ffffff", bg = "#800080", gui = "bold" } },
					replace = { a = { fg = "#ffffff", bg = "#ff0000", gui = "bold" } },
					inactive = {
						a = { fg = "#C0C0C0", bg = "#000000", gui = "bold" },
						b = { fg = "#808080", bg = "#000000" },
						c = { fg = "#C0C0C0", bg = "#000000" },
					},
				},
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = false,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename", "filesize" },
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		},
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function(_, opts)
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
			require("trouble").setup(opts)
		end,
		opts = {

			position = "bottom", -- position of the list can be: bottom, top, left, right
			height = 10, -- height of the trouble list when position is top or bottom
			width = 50, -- width of the list when position is left or right
			icons = true, -- use devicons for filenames
			mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
			severity = nil, -- nil (ALL) or vim.diagnostic.severity.ERROR | WARN | INFO | HINT
			fold_open = "", -- icon used for open folds
			fold_closed = "", -- icon used for closed folds
			group = true, -- group results by file
			padding = true, -- add an extra new line on top of the list
			cycle_results = true, -- cycle item list when reaching beginning or end of list
			action_keys = { -- key mappings for actions in the trouble list
				-- map to {} to remove a mapping, for example:
				-- close = {},
				close = "q", -- close the list
				cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
				refresh = "r", -- manually refresh
				jump = { "<cr>", "<tab>", "<2-leftmouse>" }, -- jump to the diagnostic or open / close folds
				open_split = { "<c-x>" }, -- open buffer in new split
				open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
				open_tab = { "<c-t>" }, -- open buffer in new tab
				jump_close = { "o" }, -- jump to the diagnostic and close the list
				toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
				switch_severity = "s", -- switch "diagnostics" severity filter level to HINT / INFO / WARN / ERROR
				toggle_preview = "P", -- toggle auto_preview
				hover = "K", -- opens a small popup with the full multiline message
				preview = "p", -- preview the diagnostic location
				open_code_href = "c", -- if present, open a URI with more information about the diagnostic error
				close_folds = { "zM", "zm" }, -- close all folds
				open_folds = { "zR", "zr" }, -- open all folds
				toggle_fold = { "zA", "za" }, -- toggle fold of current file
				previous = "k", -- previous item
				next = "j", -- next item
				help = "?", -- help menu
			},
			multiline = true, -- render multi-line messages
			indent_lines = true, -- add an indent guide below the fold icons
			win_config = { border = "single" }, -- window configuration for floating windows. See |nvim_open_win()|.
			auto_open = false, -- automatically open the list when you have diagnostics
			auto_close = false, -- automatically close the list when you have no diagnostics
			auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
			auto_fold = false, -- automatically fold a file trouble list at creation
			auto_jump = { "lsp_definitions" }, -- for the given modes, automatically jump if there is only a single result
			include_declaration = { "lsp_references", "lsp_implementations", "lsp_definitions" }, -- for the given modes, include the declaration of the current symbol in the results
			use_diagnostic_signs = false, -- enabling this will use the signs defined in your lsp client
		},
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
			local supportedFT = {
				"*.ts",
				"*.tsx",
				"*.js",
				"*.jsx",
				"*.html",
				"*.json",
				"*.go",
				"*.c",
				"*.py",
				"*.cpp",
				"*.rs",
				"*.h",
				"*.hpp",
				"*.lua",
				"*.vue",
				"*.java",
				"*.cs",
				"*.dart",
			}

			local unsupportedFT = {
				aerial = true,
				dashboard = true,
				help = true,
				lspinfo = true,
				lspsagafinder = true,
				packer = true,
				checkhealth = true,
				man = true,
				mason = true,
				NvimTree = true,
				["neo-tree"] = true,
				plugin = true,
				lazy = true,
				TelescopePrompt = true,
				[""] = true, -- because TelescopePrompt will set a empty ft, so add this.
				alpha = true,
				toggleterm = true,
				sagafinder = true,
				sagaoutline = true,
				better_term = true,
				fugitiveblame = true,
				Trouble = true,
				qf = true,
				Outline = true,
				starter = true,
				NeogitPopup = true,
				NeogitStatus = true,
				DiffviewFiles = true,
				DiffviewFileHistory = true,
				DressingInput = true,
				spectre_panel = true,
				zsh = true,
				registers = true,
				startuptime = true,
				OverseerList = true,
				Navbuddy = true,
				noice = true,
				notify = true,
				["dap-repl"] = true,
				saga_codeaction = true,
				sagarename = true,
				cmp_menu = true,
				["null-ls-info"] = true,
			}

			local M = {
				chunk = {
					enable = true,
					notify = true,
					use_treesitter = true,
					support_filetypes = supportedFT,
					exclude_filetypes = unsupportedFT,
					chars = {
						horizontal_line = "─",
						vertical_line = "│",
						left_top = "╭",
						left_bottom = "╰",
						right_arrow = ">",
					},
					-- style = {
					-- 	{ fg = "#45475a" },
					-- },
				},

				indent = {
					enable = true,
					use_treesitter = false,
					support_filetypes = supportedFT,
					exclude_filetypes = unsupportedFT,
					chars = {
						"│",
					},
					style = {
						{ fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui") },
					},
				},

				line_num = {
					enable = false,
					use_treesitter = false,
					support_filetypes = supportedFT,
					exclude_filetypes = unsupportedFT,
					-- style = "#806d9c",
				},

				blank = {
					enable = true,
					support_filetypes = supportedFT,
					exclude_filetypes = unsupportedFT,
					chars = {
						"·",
					},
					style = {
						vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui"),
					},
				},
			}
			require("hlchunk").setup(M)
		end,
	},
	{
		"stevearc/conform.nvim",
		lazy = false,
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "[F]ormat buffer",
			},
		},
		opts = {
			notify_on_error = false,
			format_on_save = function(bufnr)
				local disable_filetypes = {}
				return {
					timeout_ms = 500,
					lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
				}
			end,
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				javascript = { { "prettierd", "prettier" } },
			},
		},
	},

	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				build = "make install_jsrgexp",
				dependencies = {
					{
						"rafamadriz/friendly-snippets",
						config = function()
							require("luasnip.loaders.from_vscode").lazy_load()
						end,
					},
				},
			},
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			luasnip.config.setup({})

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				completion = {
					completeopt = "meun,menuone,noinsert",
				},
				mappings = cmp.mapping.preset.insert({
					["<C-o>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-n>"] = cmp.mapping.scroll_docs(-4),
					["<C-b>"] = cmp.mapping.scroll_docs(4),
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
					["<C-Space>"] = cmp.mapping.complete({}),
					["<C-l>"] = cmp.mapping(function()
						if luasnip.expand_or_locally_jumpable then
							luasnip.expand_or_jump()
						end
					end, { "i", "s" }),
					["<C-h>"] = cmp.mapping(function()
						if luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						end
					end, { "i", "s" }),
				}),
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"nvim-telescope/telescope.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
			{ "folke/neodev.nvim", opts = {} },
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("custom-lsp-attach", { clear = true }),
				callback = function(event)
					local telescopebuiltin = require("telescope.builtin")
					local lspbuf = vim.lsp.buf
					vim.keymap.set(
						"n",
						"gd",
						telescopebuiltin.lsp_definitions,
						{ buffer = event.buf, desc = "[LSP] [G]oto [D]efinition" }
					)
					vim.keymap.set(
						"n",
						"gr",
						telescopebuiltin.lsp_implementations,
						{ buffer = event.buf, desc = "[LSP] [G]oto [R]eferences" }
					)
					vim.keymap.set(
						"n",
						"gI",
						telescopebuiltin.lsp_document_symbols,
						{ buffer = event.buf, desc = "[LSP] [G]oto [I]mplementations" }
					)
					vim.keymap.set(
						"n",
						"<leader>d",
						telescopebuiltin.lsp_type_definitions,
						{ buffer = event.buf, desc = "[LSP] Type [D]efinitions" }
					)
					vim.keymap.set(
						"n",
						"<leader>ds",
						telescopebuiltin.lsp_document_symbols,
						{ buffer = event.buf, desc = "[LSP] [D]ocument [S]ymbols" }
					)
					vim.keymap.set(
						"n",
						"<leader>ws",
						telescopebuiltin.lsp_dynamic_workspace_symbols,
						{ buffer = event.buf, desc = "[LSP] [W]orkspace [S]ymbols" }
					)
					vim.keymap.set("n", "<leader>rn", lspbuf.rename, { buffer = event.buf, desc = "[LSP] [R]e[n]ame" })
					vim.keymap.set(
						"n",
						"<leader>ca",
						lspbuf.code_action,
						{ buffer = event.buf, desc = "[LSP] [C]ode [A]ction" }
					)
					vim.keymap.set("n", "K", lspbuf.hover, { buffer = event.buf, desc = "[LSP] Hover Documentation" })
					vim.keymap.set(
						"n",
						"gD",
						lspbuf.declaration,
						{ buffer = event.buf, desc = "[LSP] [G]oto [D]eclaration" }
					)

					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client.server_capabilities.documentHighlightProvider then
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							callback = vim.lsp.buf.clear_references,
						})
					end
				end,
			})

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			local servers = {
				clangd = {},
				gopls = {},
				rust_analyzer = {},
				lua_ls = {
					settings = {
						Lua = {
							runtime = {
								version = "LuaJIT",
							},
							workspace = {
								library = vim.api.nvim_get_runtime_file("", true),
							},
							telemetry = { enable = false, enabled = false },
							completion = {
								callSnippet = "Replace",
							},
							diagnostics = {
								globals = { "vim" },
								disable = {
									"missing-fields",
								},
							},
						},
					},
				},
			}

			require("mason").setup({
				ui = {
					border = "rounded",
				},
			})

			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"stylua",
			})

			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter-context",
		opts = {
			enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
			max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
			min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
			line_numbers = true,
			multiline_threshold = 20, -- Maximum number of lines to show for a single context
			trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
			mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
			-- Separator between context and content. Should be a single character string, like '-'.
			-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
			separator = nil,
			zindex = 20, -- The Z-index of the context window
			on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		priority = 1000,
		opts = {
			ensure_installed = {
				"bash",
				"c",
				"html",
				"lua",
				"luadoc",
				"markdown",
				"vim",
				"vimdoc",
				"rust",
				"css",
				"gitignore",
				"go",
				"gomod",
				"gosum",
				"gowork",
				"java",
				"typescript",
				"javascript",
				"tsx",
				"jsx",
				"python",
				"zig",
				"asm",
			},
			auto_install = true,
			highlight = {
				enable = true,
			},
			indent = { enable = true },
			autotag = {
				enable = true,
			},
			tree_docs = { enable = true },
			config = function(_, opts)
				---@diagnostic disable-next-line: missing-fields
				require("nvim-treesitter.configs").setup(opts)
			end,
		},
	},

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
	{
		"niT-Tin/springboot-start.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"MunifTanjim/nui.nvim",
		},
		ft = { "java" },
		config = function()
			require("springboot-start").setup({})
		end,
	},
	{
		"nvim-java/nvim-java",
		dependencies = {
			"nvim-java/lua-async-await",
			"nvim-java/nvim-java-core",
			"nvim-java/nvim-java-test",
			"nvim-java/nvim-java-dap",
			"MunifTanjim/nui.nvim",
			"neovim/nvim-lspconfig",
			"mfussenegger/nvim-dap",
			{
				"williamboman/mason.nvim",
				opts = {
					registries = {
						"github:nvim-java/mason-registry",
						"github:mason-org/mason-registry",
					},
				},
			},
		},
		ft = { "java" },
	},
	{
		"andweeb/presence.nvim",
		lazy = true,
		event = "UIEnter",
	},
}

local lazyconfig = {
	ui = {
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end

---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(plugins, lazyconfig)

-- POST SECTION

-- MODELINE
-- vim: ts=4 sts=4 sw=4 et nu rnu si scs sms spell title
