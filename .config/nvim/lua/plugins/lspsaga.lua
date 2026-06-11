vim.pack.add({
  "https://github.com/nvimdev/lspsaga.nvim"
})

local lsp_saga = require("lspsaga")

lsp_saga.setup()

vim.keymap.set("n", "<leader>lf", "<CMD>Lspsaga finder<CR>", { desc = "Find LSP Methods" })
vim.keymap.set("n", "<leader>lo", "<CMD>Lspsaga outline<CR>", { desc = "Toggle Outline" })
vim.keymap.set("n", "<leader>lr", "<CMD>Lspsaga project_replace<CR>", {desc = "Project-wide Rename"})
