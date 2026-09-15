vim.pack.add({
  "https://github.com/rachartier/tiny-code-action.nvim"
})

local tca = require("tiny-code-action")
tca.setup({
  backend = "delta",
  picker = "fzf-lua"
})
