vim.pack.add({
"https://github.com/brenoprata10/nvim-highlight-colors"
})

local highlight_colors = require("nvim-highlight-colors")
highlight_colors.setup({
  render="virtual",
  virtual_symbol="󰧞",
  virtual_symbol_position="inline",
  enable_named_colors=false
})
