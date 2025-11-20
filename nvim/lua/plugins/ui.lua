return {
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({
				theme = "doom",
				config = {
					week_header = {
						enable = true,
					},
					center = {
						{
							icon = " ",
							icon_hl = "Title",
							desc = "Find Files",
							desc_hl = "String",
							key = "f",
							key_hl = "Number",
							key_format = "%s",
							action = ":Telescope find_files",
						},
						{
							icon = "󰒲 ",
							icon_hl = "Title",
							desc = "Lazy",
							desc_hl = "String",
							key = "l",
							key_hl = "Number",
							key_format = "%s",
							action = ":Lazy",
						},
						{
							icon = "󰙅 ",
							icon_hl = "Title",
							desc = "File Tree",
							desc_hl = "String",
							key = "o",
							key_hl = "Number",
							key_format = "%s",
							action = ":Oil",
						},
						{
							icon = "󰩈 ",
							icon_hl = "Title",
							desc = "Quit",
							desc_hl = "String",
							key = "q",
							key_format = "%s",
							action = ":q",
						},
					},
					vertical_center = true,
				},
			})
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
	{
		"savq/melange-nvim",
		config = function()
			vim.cmd.colorscheme("melange")
		end,
	},
}
