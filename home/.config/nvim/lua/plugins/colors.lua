vim.pack.add({
  "https://github.com/catgoose/nvim-colorizer.lua",
  "https://github.com/max397574/colortils.nvim"
})

local colorizer = require("colorizer")
local colortils = require ("colortils")

colorizer.setup({
  "*",
  css = { rgb_fn = true; },
  html = { names = false; }
})

colortils.setup()
