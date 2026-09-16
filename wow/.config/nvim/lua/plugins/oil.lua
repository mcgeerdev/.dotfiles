return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {
		-- Start a libuv fs_event watcher per oil buffer so external file changes
		-- (git checkout, another editor, an agent writing files) rerender the
		-- listing instead of leaving a stale buffer behind.
		watch_for_changes = true,
		keymaps = {
			["yp"] = {
				desc = "Copy filepath to system clipboard",
				callback = function()
					require("oil.actions").copy_entry_path.callback()
					vim.fn.setreg("+", vim.fn.getreg(vim.v.register))
				end,
			},
		},
	},
	-- Optional dependencies
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
	-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
	lazy = false,
}
