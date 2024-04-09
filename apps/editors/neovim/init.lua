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

-- Save undo history
vim.o.undofile = true

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

-- Enables autosaving
vim.cmd("set autowriteall")
vim.api.nvim_create_autocmd("TextChanged", { pattern = "<buffer>", command = "silent write" })
vim.api.nvim_create_autocmd("TextChangedI", { pattern = "<buffer>", command = "silent write" })

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

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end

---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

local plugins = {
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
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
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
				},
			})

			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "ui-select")

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
					local vimlsp = vim.lsp
					local lspbuf = vim.lsp.buf
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end
					map("gd", telescopebuiltin.lsp_definitions, "[G]oto [D]efinition")
					map("gr", telescopebuiltin.lsp_implementations, "[G]oto [R]eferences")
					map("gI", telescopebuiltin.lsp_document_symbols, "[G]oto [I]mplementations")
					map("<leader>d", telescopebuiltin.lsp_type_definitions, "Type [D]efinitions")
					map("<leader>ds", telescopebuiltin.lsp_document_symbols, "[D]ocument [S]ymbols")
					map("<leader>ws", telescopebuiltin.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
					map("<leader>rn", lspbuf.rename, "[R]e[n]ame")
					map("<leader>ca", vimlsp.code_action, "[C]ode [A]ction")
					map("K", lspbuf.hover, "Hover Documentation")
					map("gD", lspbuf.declaration, "[G]oto [D]eclaration")

					local client = vimlsp.get_client_by_id(event.data.client_id)
					if client and client.server_capabilities.documentHighlightProvider then
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							biffer = event.buf,
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
							completion = {
								callSnippet = "Replace",
							},
							diagnostics = {
								disable = {
									"missing-fields",
								},
							},
						},
					},
				},
			}

			require("mason").setup()

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
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			sign = false,
		},
	},
	{
		"echasnovski/mini.nvim",
		config = function()
			require("mini.ai").setup({ n_lines = 500 })
			require("mini.surround").setup()
		end,
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
			config = function(_, opts)
				---@diagnostic disable-next-line: missing-fileds
				require("nvim-treesitter.configs").setup(opts)
			end,
		},
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

require("lazy").setup(plugins)

-- POST SECTION

-- MODELINE
-- vim: ts=4 sts=4 sw=4 et nu rnu si scs sms spell title
