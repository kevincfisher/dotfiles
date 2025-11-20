return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		plugins = {
			spelling = {
				enabled = true,
				suggestions = 20,
			},
		},
		win = {
			border = "single",
		},
	},
}
