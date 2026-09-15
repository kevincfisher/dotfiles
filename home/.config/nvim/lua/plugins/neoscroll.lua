vim.pack.add({
    "https://github.com/karb94/neoscroll.nvim",
})

local neoscroll = require("neoscroll")


neoscroll.setup({
  hide_cursor = false,
  stop_eof = true,
  easing = 'quadratic',
  duration_multiplier = 0.4
})
