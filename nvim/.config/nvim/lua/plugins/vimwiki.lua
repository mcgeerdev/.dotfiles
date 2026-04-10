return {
	"vimwiki/vimwiki",
	event = "VeryLazy",
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		-- Configure wiki list
		vim.g.vimwiki_list = {
			{
				path = "~/vimwiki/",
				syntax = "markdown",
				ext = ".md",
			},
		}

		-- Restrict vimwiki to configured paths only
		vim.g.vimwiki_global_ext = 0

		-- Keymaps
		vim.keymap.set("n", "<leader>w", "<Plug>Vimwiki", { desc = "[W]iki" })
		vim.keymap.set("n", "<leader>ww", "<Plug>VimwikiIndex", { desc = "[W]iki [W]iki Index" })
		vim.keymap.set("n", "<leader>wt", "<Plug>VimwikiTabIndex", { desc = "[W]iki [T]ab Index" })
		vim.keymap.set("n", "<leader>ws", "<Plug>VimwikiUISelect", { desc = "[W]iki [S]elect" })
		vim.keymap.set("n", "<leader>wi", "<Plug>VimwikiDiaryIndex", { desc = "[W]iki D[i]ary Index" })
		vim.keymap.set("n", "<leader>w<leader>w", "<Plug>VimwikiMakeDiaryNote", { desc = "[W]iki Diary Note" })
		vim.keymap.set("n", "<leader>w<leader>t", "<Plug>VimwikiTabMakeDiaryNote", { desc = "[W]iki Diary Note Tab" })

		-- Telescope integration for wiki files
		vim.keymap.set("n", "<leader>sw", function()
			require("telescope.builtin").find_files({
				prompt_title = "Find Wiki Files",
				cwd = vim.fn.expand("~/vimwiki"),
				find_command = { "find", ".", "-type", "f", "-name", "*.md" },
			})
		end, { desc = "[S]earch [W]iki files" })

		vim.keymap.set("n", "<leader>swg", function()
			require("telescope.builtin").live_grep({
				prompt_title = "Search Wiki Content",
				cwd = vim.fn.expand("~/vimwiki"),
			})
		end, { desc = "[S]earch [W]iki [G]rep" })
	end,
}
