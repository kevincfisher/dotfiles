return {
	"greggh/claude-code.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim", -- Required for git operations
	},
	config = function()
		require("claude-code").setup({
			window = {
				position = "float",
				float = {
					width = "90%",
					height = "90%",
					row = "center",
					col = "center",
					relative = "editor",
					border = "double",
				},
			},
		})
		vim.keymap.set("n", "<leader>cc", "<CMD>ClaudeCode<CR>", { desc = "Open Claude Chat" })
	end,
}
