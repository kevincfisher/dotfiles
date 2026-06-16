vim.pack.add({
  "https://github.com/rebelot/kanagawa.nvim",
  "https://github.com/folke/tokyonight.nvim",
  "https://github.com/rose-pine/neovim",
  "https://github.com/EdenEast/nightfox.nvim",
  "https://github.com/xiyaowong/transparent.nvim"
})

local kanagawa = require('kanagawa')
local tokyonight = require("tokyonight")
local rosepine = require("rose-pine")
local nightfox = require("nightfox")
kanagawa.setup({
  colors = {
    theme = {
      all = {
        ui = {
          bg_gutter = "none"
        }
      }
    }
  }
});
tokyonight.setup()
rosepine.setup()
nightfox.setup({
  options = {
    styles = {
      comments = "italic",
      keywords = "bold",
      functions = "italic,bold",
      -- variables = "none",
    },
  },
})
-- Default theme
vim.cmd('colorscheme rose-pine')


