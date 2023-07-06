local M = {}

---@type Base46HLGroupsList
M.override = {
	Comment = {
		italic = true,
		fg = "#313244",
		bg = "NONE",
		blend = 100,
	},
	DiagnosticInformation = { fg = "red" },
	LspSignatureActiveParameter = { fg = "white", bg = "green" },
	--NoiceLspProgressSpinner = { bg = "NONE" },
	--NoiceLspProgressTitle = { bg = "NONE" },
	--NoiceLspProgressClient = { bg = "NONE" },
}

---@type HLTable
M.add = {
	NvimTreeOpenedFolderName = { fg = "green", bold = true },
}

M.catppuccin = {
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	background = { -- :h background
		light = "latte",
		dark = "mocha",
	},
	transparent_background = true, -- disables setting the background color.
	show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
	term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
	dim_inactive = {
		enabled = false, -- dims the background color of inactive window
		shade = "dark",
		percentage = 0.15, -- percentage of the shade to apply to the inactive window
	},
	no_italic = false, -- Force no italic
	no_bold = false, -- Force no bold
	no_underline = false, -- Force no underline
	styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
		comments = { "italic" }, -- Change the style of comments
		conditionals = { "italic" },
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	color_overrides = {},
	custom_highlights = {},
	integrations = {
		semantic_tokens = true,
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		telescope = true,
		notify = true,
		mini = true,
		mason = true,
		noice = true,
		treesitter_context = true,
		treesitter = true,
		overseer = true,
		lsp_trouble = true,
		which_key = true,
		dropbar = {
			enabled = true,
			color_mode = true, -- enable color for kind's texts, not just kind's icons
		},
		indent_blankline = {
			enabled = true,
			colored_indent_levels = true,
		},
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
			inlay_hints = {
				background = true,
			},
		},
	},
}

return M
