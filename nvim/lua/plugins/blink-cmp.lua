return {
	{
		"saghen/blink.cmp",
		event = "VimEnter",
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				version = "2.*",
				build = (function()
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
				dependencies = {
					"rafamadriz/friendly-snippets",
					config = function()
						require("luasnip.loaders.from_vscode").lazy_load()
					end,
				},
				opts = {},
			},
			"folke/lazydev.nvim",
			"MahanRahmati/blink-nerdfont.nvim",
		},
		version = "1.*",
		opts = {
			-- See :h blink-cmp-config-keymap for defining your own keymap
			keymap = { preset = "default" },

			appearance = {
				nerd_font_variant = "mono",
			},

			completion = { documentation = { auto_show = true, auto_show_delay_ms = 500 } },

			sources = {
				default = { "lsp", "path", "snippets", "lazydev", "nerdfont" },
				providers = {
					lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
					nerdfont = {
						module = "blink-nerdfont",
						score_offset = 15,
						name = "Nerd Fonts",
						opts = { insert = true },
					},
				},
			},
			snippets = { preset = "luasnip" },

			signature = { enabled = true },

			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
}
