return {
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local telescope = require("telescope")
			local builtin = require("telescope.builtin")
			local keymap = vim.keymap
			telescope.setup()
			-- load telescope-fzf-native
			require("telescope").load_extension("fzf")

			-- keymaps -- pickers
			keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
			keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Find files tracked by Git" })
			keymap.set("n", "<leader>gs", builtin.grep_string, { desc = "Grep string under cursor" })
			keymap.set("n", "<leader>lg", builtin.live_grep, { desc = "Live Grep" })
			keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffer" })
			keymap.set(
				"n",
				"<leader>fs",
				builtin.current_buffer_fuzzy_find,
				{ desc = "Search current buffer for string" }
			)
			keymap.set("n", "<leader>fc", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "Find Config Files" })

			keymap.set("n", "<leader>fm", builtin.man_pages, { desc = "Search man pages" })
		end,
	},
}
