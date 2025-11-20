return {
	"folke/todo-comments.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local todo = require("todo-comments")
		todo.setup({
			vim.keymap.set("n", "]t", function()
				todo.jump_next()
			end, { desc = "Jump to next todo comment" }),
			vim.keymap.set("n", "[t", function()
				todo.jump_prev()
			end, { desc = "Jump to previous todo comment" }),

			vim.keymap.set("n", "<leader>xT", function()
				todo.search({ keywords = { "TODO", "FIX", "HACK", "WARN", "NOTE", "TEST" } })
			end, { desc = "Search all todo comments" }),
			vim.keymap.set("n", "<leader>xq", "<Cmd>TodoQuickFix<CR>", { desc = "Todo comments in quickfix" }),
		})
	end,
}
