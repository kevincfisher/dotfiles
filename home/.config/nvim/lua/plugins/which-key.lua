vim.pack.add({
	"https://github.com/folke/which-key.nvim",
})

local which_key = require("which-key")

which_key.setup({})

which_key.add({
	{ "<leader>f", group = "Find/Files" },
	{ "<leader>a", group = "AI Actions" },
	{ "<leader>d", group = "Diagnostics" },
	{ "<leader>g", group = "Git" },
  { "<leader>c", group = "Code Actions" },
	{ "<leader>x", group = "diagnostics/quickfix", icon = { icon = "󱖫 ", color = "green" } },
	{
		"<leader>b",
		group = "Buffers",
		expand = function()
			return require("which-key.extras").expand.buf()
		end,
	},
	{
		"<leader>w",
		group = "Windows",
		proxy = "<c-w>",
		expand = function()
			return require("which-key.extras").expand.win()
		end,
	},
	{ "gx", desc = "Open with system app" },
})
