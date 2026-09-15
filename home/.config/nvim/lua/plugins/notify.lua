vim.pack.add({
  "https://github.com/nvim-mini/mini.notify",
  "https://github.com/MunifTanjim/nui.nvim",
  "https://github.com/folke/noice.nvim",
  "https://github.com/rcarriga/nvim-notify",
})

require("notify")
local noice = require("noice")

noice.setup({
  presets = { 
    command_palette = true
  }
})
