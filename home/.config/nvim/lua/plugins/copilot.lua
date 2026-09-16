vim.pack.add({
	"https://github.com/copilotlsp-nvim/copilot-lsp",
	"https://github.com/zbirenbaum/copilot.lua",
})

local copilot = require("copilot")

local grp = vim.api.nvim_create_augroup("Copilot", { clear = true })
vim.api.nvim_create_autocmd("InsertEnter", {
	pattern = "*",
	group = grp,
  once = true,
	callback = function()
		copilot.setup({
			suggestion = {
				enabled = true,
				auto_trigger = true,
				keymap = {
					accept = "<Tab>",
					next = "<M-]>",
					prev = "<M-[>",
					dismiss = "<C-]>",
				},
			},
		})
	end,
})

-- toggle copilot suggestions when completion menu is visible
vim.api.nvim_create_autocmd("User", {
  pattern="BlinkCmpMenuOpen",
  callback=function()
    vim.b.copilot_suggestion_hidden = true
  end,
})
vim.api.nvim_create_autocmd("User", {
  pattern = "BlinkCmpMenuClose",
  callback = function ()
    vim.b.copilot_suggestion_hidden = false
  end
})
