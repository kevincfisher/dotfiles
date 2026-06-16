vim.pack.add({
	"https://github.com/saghen/blink.lib",
	"https://github.com/saghen/blink.cmp",
	"https://github.com/L3MON4D3/LuaSnip",
	"https://github.com/xzbdmw/colorful-menu.nvim",
})
local cmp = require("blink.cmp")
cmp.build():pwait()
cmp.setup({
  cmdline = {
    keymap = { preset = "inherit" },
    completion = { menu = { auto_show = false } }
  },
	keymap = {
		preset = "default",
	},
	completion = {
		documentation = {
			auto_show = false,
			window = { border = "single" },
		},
		ghost_text = {
			enabled = true,
		},
		menu = {
			border = "single",
			draw = {
				columns = { { "kind_icon" }, { "label", gap = 1 } },
				components = {
					label = {
						text = function(ctx)
							return require("colorful-menu").blink_components_text(ctx)
						end,
						highlight = function(ctx)
							return require("colorful-menu").blink_components_highlight(ctx)
						end,
					},
				},
			},
		},
	},
	snippets = { preset = "luasnip" },
	signature = { window = { border = "single" } },
	sources = { default = { "lsp", "path", "snippets", "buffer" } },
	fuzzy = { implementation = "rust" },
})
