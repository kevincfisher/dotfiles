vim.pack.add({
  "https://github.com/OXY2DEV/markview.nvim",
  "https://github.com/iamcco/markdown-preview.nvim",
})


vim.keymap.set("n", "<leader>mp", function()
vim.fn["mkdp#util#inst``all"]()
vim.cmd("MarkdownPreviewToggle")
end, { desc = "Markdown preview" })
