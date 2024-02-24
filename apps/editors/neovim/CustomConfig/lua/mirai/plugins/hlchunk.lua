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
		style = {
			{ fg = "#45475a" },
		},
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
		style = "#806d9c",
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

return M
