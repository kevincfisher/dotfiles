return {
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		event = "BufReadPost",
		dependencies = { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
		config = function()
			require("nvim-treesitter.configs").setup({
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["af"] = { query = "@function.outer", desc = "Select around function" },
							["if"] = { query = "@function.inner", desc = "Select inside function" },
							["aa"] = { query = "@parameter.outer", desc = "Select around parameter" },
							["ia"] = { query = "@parameter.inner", desc = "Select inside parameter" },
							["ac"] = { query = "@class.outer", desc = "Select around class" },
							["ic"] = { query = "@class.inner", desc = "Select inside class" },
						},
					},
				},
			})
		end,
	},
}
