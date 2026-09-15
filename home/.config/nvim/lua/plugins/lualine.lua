vim.pack.add({
    'https://github.com/nvim-lualine/lualine.nvim'
})

local lualine = require("lualine")
lualine.setup({
  sections = {
    lualine_x = {
      {
        require("noice").api.statusline.mode.get,
        cond = require("noice").api.statusline.mode.has,
        color = { fg = "#ff9e64"}
      }
    }
  },
  extensions = { "oil" }
})
