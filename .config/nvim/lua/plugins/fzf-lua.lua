vim.pack.add({
  "https://github.com/ibhagwan/fzf-lua",
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/nvim-mini/mini.icons",
})

local fzf = require("fzf-lua")

fzf.setup({
  ui_select = true,
  color_icons = true,
  keymap = {
    bat = {
			["<C-d>"] = 'preview-page-down', -- Better scrolling within the displays
			["<C-u>"] = 'preview-page-up',
		},
  },
  winopts = {
    preview = {
      default = "bat"
    }
  }
})

-- Key Binds --
vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "Fuzzy Find Files"})
vim.keymap.set("n", "<leader>/", fzf.live_grep, { desc = "Fuzzy Find - Live Grep"})
vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "Fuzzy Find Buffers" })
vim.keymap.set("n", "<leader>fh", fzf.help_tags, { desc = "Fuzzy Find Help Tags"})
vim.keymap.set("n", "<leader>fx", fzf.diagnostics_document, { desc = "Fuzzy Find Diagnostics - Document" })
vim.keymap.set("n", "<leader>fX", fzf.diagnostics_workspace, { desc = "Fuzzy Find Diagnostics - Workspace" })
vim.keymap.set("n", "<leader>fc", fzf.colorschemes, { desc = "Select Theme"})
vim.keymap.set("n", "<leader>fi", fzf.highlights, { desc = "Search Highlight groups"})

-- Convenience binds
vim.keymap.set("n", "<leader>fs", function() fzf.files({ cwd = "~/.config/nvim", prompt = "Neovim Config" }) end, { desc = "Search Editor Config" })


vim.keymap.set("n", "grr", fzf.lsp_references, { desc = "References" })
vim.keymap.set("n", "gri", fzf.lsp_implementations, { desc = "Implementations" })
vim.keymap.set("n", "gra", fzf.lsp_code_actions, { desc = "Code Actions" })
vim.keymap.set("n", "gd", fzf.lsp_definitions, { desc = "Go to definition" })
