vim.pack.add({
  "https://github.com/github/copilot.vim"
})

vim.keymap.set("n", "<leader>ai", "<cmd>Copilot panel<CR>", { desc = "Open Copliot Panel"})
vim.keymap.set("n", "<leader>ae", "<cmd>Copilot enable<CR>", { desc = "Enable Copliot"})
vim.keymap.set("n", "<leader>ad", "<cmd>Copilot disable<CR>", { desc = "Disable Copliot"})


