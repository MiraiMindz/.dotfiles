---@type MappingsTable
local M = {}

M.general = {
	n = {
		[";"] = { ":", "enter cmdline", opts = { nowait = true } },
		["<leaderm>"] = { ":Glow!<CR>", "Renders the current Markdown file using Glow", opts = { nowait = true } },
		["<leader>t"] = {
			function()
				require("base46").toggle_transparency()
			end,
			"toggle transparency",
		},
		["<F6>"] = { ":CompilerOpen<CR>", "Opens a compiler", opts = { noremap = true, silent = true } },
		["<S-F6>"] = {
			":CompilerToggleResults<CR>",
			"Opens the compiling results",
			opts = { noremap = true, silent = true },
		},
	},
	i = {
		["<C-BS>"] = { "<Esc>cvb", "Deletes entire words", opts = { noremap = true } },
	},
}

M.dap = {
	plugin = true,
	n = {
		["<leader>db"] = {
			":DapToggleBreakpoint<CR>",
			"Add a breakpoint at a cursor line",
			opts = {
				noremap = true,
				nowait = true,
			},
		},
		["<leader>dv"] = {
			function()
				local widgets = require("dap.ui.widgets")
				local sidebar = widgets.sidebar(widgets.scope)
				sidebar.open()
			end,
			"Opens debugging sidebar",
		},
	},
}

M.dap_go = {
	plugin = true,
	n = {
		["<leader>dg"] = {
			function()
				require("dap-go").debug_test()
			end,
			"Debug Go test",
			opts = {
				noremap = true,
				nowait = true,
			},
		},
		["<leader>dc"] = {
			function()
				require("dap-go").debug_last()
			end,
			"Debug last Go test",
			opts = {
				noremap = true,
				nowait = true,
			},
		},
	},
}

M.gopher = {
	plugin = true,
	n = {
		["<leader>gj"] = {
			":GoTagAdd json <CR>",
			"Add JSON tags to Go structs",
			opts = {
				noremap = true,
				nowait = true,
			},
		},
		["<leader>gy"] = {
			":GoTagAdd yaml <CR>",
			"Add YAML tags to Go structs",
			opts = {
				noremap = true,
				nowait = true,
			},
		},
	},
}

M.dap_python = {
	plugin = true,
	n = {
		["<leader>dp"] = {
			function()
				require("dap-python").test_method()
			end,
			"Debug Python Files",
			opts = {
				noremap = true,
				nowait = true,
			},
		},
	},
}

M.crates = {
	n = {
		["<leader>rcu"] = {
			function()
				require("crates").upgrade_all_crates()
			end,
			"Upgrade all crates",
			opts = {
				noremap = true,
				nowait = true,
			},
		},
	},
}

return M
