return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter", "nvim-mini/mini.nvim" },
	config = function()
		require("render-markdown").setup({
			completions = { lsp = { enable = true } },
		})
	end,
}
