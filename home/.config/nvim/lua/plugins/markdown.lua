vim.pack.add({
  "http://github.com/MeanderingProgrammer/render-markdown.nvim",
})

require("render-markdown").setup({
  completions = { lsp = { enabled = true } }
})

vim.keymap.set("n", "<leader>md", function ()
  require("render-markdown").toggle()
end, { desc = "Toggle Render Markdown" })
vim.keymap.set("n", "<leader>mp", function ()
  require("render-markdown").preview()
end, { desc = "Preview Markdown" })
