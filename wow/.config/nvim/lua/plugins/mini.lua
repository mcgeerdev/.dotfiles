return {
	"echasnovski/mini.nvim",
	config = function()
		-- Better Around/Inside textobjects
		require("mini.ai").setup({ n_lines = 500 })

		-- Add/delete/replace surroundings (brackets, quotes, etc.)
		require("mini.surround").setup()

		-- Simple and easy statusline
		local statusline = require("mini.statusline")
		statusline.setup({
			use_icons = vim.g.have_nerd_font,
		})

		-- Customize statusline sections
		statusline.section_location = function()
			return "%2l:%-2v"
		end
		statusline.section_mode = function()
			return "%-5{%v:lua.string.upper(v:lua.vim.fn.mode())%}"
		end
	end,
}